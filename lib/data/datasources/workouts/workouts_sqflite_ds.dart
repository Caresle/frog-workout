import 'package:uuid/uuid.dart';
import 'package:workouts_app/config/config.dart';
import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/entities/exercise_entity.dart';
import 'package:workouts_app/domain/entities/workout_entity.dart';

class WorkoutsSqfliteDs extends WorkoutLocalDs {
  final String tableName = "tbl_wk_workouts";
  final String tableDetails = "tbl_wk_workouts_det";
  final String tableExercises = "tbl_wk_workouts_exercises";

  @override
  Future<void> addExercise(String workoutId, List<Exercise> exercises) async {
    if (exercises.isEmpty) return;

    final db = await DbHandler().getInstance();

    final exists = await db.query(
      tableName,
      where: "id = ?",
      whereArgs: [workoutId],
    );

    if (exists.isEmpty) {
      await db.insert(tableName, {'id': workoutId});
    }

    for (var exercise in exercises) {
      final values = ExerciseMapper.toJsonWorkoutExercise(workoutId, exercise);
      final exists = await db.query(
        tableExercises,
        where: 'id_exercise = ? and id_workout = ?',
        whereArgs: [exercise.id, workoutId],
      );

      if (exists.isNotEmpty) {
        continue;
      }

      await db.insert(tableExercises, values);
    }
  }

  @override
  Future<Workout> create(Workout workout) async {
    final db = await DbHandler().getInstance();

    final newWorkout = workout.copyWith(id: Uuid().v4());

    final values = WorkoutMapper.toJson(newWorkout);

    await db.insert(tableName, values);
    await db.update(
      tableExercises,
      {'id_workout': newWorkout.id},
      where: 'id_workout = ?',
      whereArgs: [workout.id],
    );

    await db.delete(
      tableDetails,
      where: "id_workout = ?",
      whereArgs: [workout.id],
    );

    for (var item in newWorkout.details.asMap().entries) {
      final index = item.key;
      final detail = item.value;

      final values = WorkoutDetailMapper.toJson(detail);
      values.remove('id');
      values['id_workout'] = newWorkout.id;
      values['set_index'] = index;

      await db.insert(tableDetails, values);
    }

    await db.delete(tableName, where: "id = ?", whereArgs: [workout.id]);

    return Future.value(newWorkout);
  }

  @override
  Future<Workout> delete(Workout workout) async {
    final db = await DbHandler().getInstance();

    await db.delete(tableName, where: "id = ?", whereArgs: [workout.id]);
    await db.delete(
      tableDetails,
      where: "id_workout = ?",
      whereArgs: [workout.id],
    );
    await db.delete(tableExercises, where: "id = ?", whereArgs: [workout.id]);
    return Future.value(workout);
  }

  @override
  Future<List<Workout>> getAll() async {
    final db = await DbHandler().getInstance();
    final workoutsRaw = await db.query(tableName);
    List<Map<String, dynamic>> result = [];

    for (var row in workoutsRaw) {
      final id = row['id'];
      final exercises = await db.rawQuery(
        '''
        select
          e.*
        from tbl_wk_exercises e
        join tbl_wk_workouts_exercises we on e.id = we.id_exercise
        where we.id_workout = ?
      ''',
        [id],
      );
      final details = await db.rawQuery(
        '''
        select * from tbl_wk_workouts_det
        where id_workout = ?
        order by id_exercise, set_index
      ''',
        [id],
      );

      result.add({...row, 'exercises': exercises, 'details': details});
    }

    final workouts = result.map((row) => WorkoutMapper.fromJson(row)).toList();
    return workouts;
  }

  @override
  Future<void> removeExercise(
    String workoutId,
    List<Exercise> exercises,
  ) async {
    final db = await DbHandler().getInstance();

    await db.delete(
      tableExercises,
      where: 'id_workout = ?',
      whereArgs: [workoutId],
    );

    for (var exercise in exercises) {
      await db.delete(
        tableExercises,
        where: 'id_exercise = ?',
        whereArgs: [exercise.id],
      );
    }
  }

  @override
  Future<Workout> update(Workout workout) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

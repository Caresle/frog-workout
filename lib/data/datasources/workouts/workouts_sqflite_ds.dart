import 'package:uuid/uuid.dart';
import 'package:workouts_app/config/config.dart';
import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/entities/exercise_entity.dart';
import 'package:workouts_app/domain/entities/workout_entity.dart';

final String vwWkWorkouts = '''
  with workouts_ds as (
    select * from tbl_wk_workouts
  ), exercises_ds as (
    select
      w.id,
        json_group_array(
          json_object(
            'id', e.id,
            'name', e.name,
            'weight_type', e.weight_type,
            'custom_created', e.custom_created,
            'id_user', e.id_user
          )
        ) exercises
    from workouts_ds w
    join tbl_wk_workouts_exercises we on we.id_workout = w.id 
    join tbl_wk_exercises e on e.id = we.id_exercise
    group by w.id
  ), details_computed as (
	  select * from tbl_wk_workouts_det
	  order by id_exercise, set_index
  ), details_ds as (
    select
      w.id,
      json_group_array(
          json_object(
            'id', wd.id,
            'id_workout', wd.id_workout,
            'id_exercise', wd.id_exercise,
            'set_index', wd.set_index,
            'set_type', wd.set_type,
            'rest_time', wd.rest_time,
            'weight', wd.weight,
            'reps', wd.reps,
            'notes', wd.notes
          )
        ) details
    from workouts_ds w
    join details_computed wd on wd.id_workout = w.id
    group by w.id
  )
  select
    w.*,
    d.details,
    e.exercises 
  from workouts_ds w
  left join details_ds d on d.id = w.id
  left join exercises_ds e on e.id = w.id
''';

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

    final result = await db.rawQuery(vwWkWorkouts);

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

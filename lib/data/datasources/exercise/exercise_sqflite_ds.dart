import 'package:workouts_app/config/config.dart';
import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/entities/exercise_entity.dart';

class ExerciseSqfliteDs extends ExerciseLocalDs {
  final String tableName = "tbl_wk_exercises";

  @override
  Future<Exercise> create(Exercise exercise) async {
    final db = await DbHandler().getInstance();
    final values = ExerciseMapper.toJson(exercise);

    values.remove('id');

    final result = await db.insert(tableName, values);

    // TODO: Handle possible errors in the insertion of the record

    return Future.value(exercise.copyWith(id: result));
  }

  @override
  Future<Exercise> delete(Exercise exercise) async {
    final db = await DbHandler().getInstance();

    await db.delete(tableName, where: 'id = ?', whereArgs: [exercise.id]);

    return Future.value(exercise);
  }

  @override
  Future<List<Exercise>> getAll() async {
    final db = await DbHandler().getInstance();

    final result = await db.query(tableName);
    final exercises = result
        .map((row) => ExerciseMapper.fromJson(row))
        .toList();
    return exercises;
  }

  @override
  Future<Exercise> update(Exercise exercise) async {
    final db = await DbHandler().getInstance();

    final values = ExerciseMapper.toJson(exercise);

    await db.update(
      tableName,
      values,
      where: 'id = ?',
      whereArgs: [exercise.id],
    );

    return Future.value(exercise);
  }
}

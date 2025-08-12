import 'package:workouts_app/config/config.dart';
import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';

class RecordSqfliteDs extends RecordLocalDs {
  final tableName = "tbl_wk_records";

  @override
  Future<void> create(List<WorkoutRecord> records) async {
    final db = await DbHandler().getInstance();

    for (var record in records) {
      final values = WorkoutRecordMapper.toJson(record);
      values.remove('id');
      await db.insert(tableName, values);
    }
  }

  @override
  Future<List<WorkoutRecord>> getAll() async {
    final db = await DbHandler().getInstance();

    final result = await db.query(tableName, orderBy: 'id DESC');
    final records = result
        .map((row) => WorkoutRecordMapper.fromJson(row))
        .toList();

    return records;
  }

  @override
  Future<List<WorkoutRecord>> getToSync() async {
    final db = await DbHandler().getInstance();

    final result = await db.query(tableName, where: 'sync_status = 0');

    final records = result
        .map((row) => WorkoutRecordMapper.fromJson(row))
        .toList();

    return records;
  }

  @override
  Future<bool> updateSyncStatus() async {
    final db = await DbHandler().getInstance();

    await db.update(tableName, {'sync_status': 1}, where: 'sync_status = 0');

    return true;
  }

  @override
  Future<List<WorkoutRecord>> getByExercise(Exercise exercise) async {
    final db = await DbHandler().getInstance();

    final result = await db.query(
      tableName,
      where: 'exercise = ?',
      whereArgs: [exercise.name],
    );

    final records = result
        .map((row) => WorkoutRecordMapper.fromJson(row))
        .toList();

    return records;
  }
}

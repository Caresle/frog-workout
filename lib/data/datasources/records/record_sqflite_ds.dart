import 'package:workouts_app/config/config.dart';
import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/entities/workout_record_entity.dart';

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
}

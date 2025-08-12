import 'package:workouts_app/config/database/supabase_handler.dart';
import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';

class SyncSupabaseDs extends SyncDs {
  final String _tableRecord = 'tbl_wk_records';

  @override
  Future<bool> syncWorkoutsRecords(List<WorkoutRecord> records) async {
    if (records.isEmpty) return true;
    final client = SupabaseHandler().getInstance();
    List<Map<String, dynamic>> values = [];

    for (var record in records) {
      final value = WorkoutRecordMapper.toJson(record);
      value.remove('id');
      value.remove('sync_status');
      value['id_user'] = 0;
      values.add(value);
    }

    await client.from(_tableRecord).insert(values);

    return true;
  }
}

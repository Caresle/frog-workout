import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/entities/workout_record_entity.dart';

class RecordLocalDsImpl extends RecordLocalDs {
  @override
  Future<void> create(List<WorkoutRecord> records) async {
    print('create records');
    await Future.value();
  }

  @override
  Future<List<WorkoutRecord>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}

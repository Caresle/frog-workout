import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';

class SyncRepositoryImpl extends SyncRepository {
  final SyncDs _repositry;

  SyncRepositoryImpl(this._repositry);

  @override
  Future<bool> syncWorkoutsRecords(List<WorkoutRecord> records) {
    return _repositry.syncWorkoutsRecords(records);
  }
}

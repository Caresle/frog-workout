import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';

class SyncRepositoryImpl extends SyncRepository {
  final SyncDs _repository;

  SyncRepositoryImpl(this._repository);

  @override
  Future<bool> syncWorkoutsRecords(List<WorkoutRecord> records) {
    return _repository.syncWorkoutsRecords(records);
  }

  @override
  Future<bool> syncWorkouts(List<Workout> workouts) {
    return _repository.syncWorkouts(workouts);
  }

  @override
  Future<bool> syncExercises(List<Exercise> exercises) {
    return _repository.syncExercises(exercises);
  }
}

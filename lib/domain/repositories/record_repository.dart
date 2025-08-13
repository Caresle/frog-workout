import 'package:workouts_app/domain/domain.dart';

abstract class RecordRepository {
  Future<List<WorkoutRecord>> getAll();
  Future<void> create(List<WorkoutRecord> records);
  Future<List<WorkoutRecord>> getToSync();
  Future<bool> updateSyncStatus();

  Future<List<WorkoutRecord>> getByExercise(Exercise exercise);
}

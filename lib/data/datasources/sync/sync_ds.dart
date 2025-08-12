import 'package:workouts_app/domain/domain.dart';

abstract class SyncDs {
  Future<bool> syncWorkoutsRecords(List<WorkoutRecord> records);
  Future<bool> syncWorkouts(List<Workout> workouts);
}

import 'package:workouts_app/domain/domain.dart';

abstract class RecordLocalDs {
  Future<void> create(List<WorkoutRecord> records);
  Future<List<WorkoutRecord>> getAll();
}

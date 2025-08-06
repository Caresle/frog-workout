import 'package:workouts_app/domain/domain.dart';

abstract class RecordRepository {
  Future<List<WorkoutRecord>> getAll();
  Future<void> create(List<WorkoutRecord> records);
}

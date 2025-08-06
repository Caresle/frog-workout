import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';

class RecordRepositoryImpl extends RecordRepository {
  final RecordLocalDs _repository;

  RecordRepositoryImpl(this._repository);

  @override
  Future<void> create(List<WorkoutRecord> records) {
    return _repository.create(records);
  }

  @override
  Future<List<WorkoutRecord>> getAll() {
    return _repository.getAll();
  }
}

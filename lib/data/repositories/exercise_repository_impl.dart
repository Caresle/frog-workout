import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';

class ExerciseRepositoryImpl extends ExerciseRepository {
  final ExerciseLocalDs _exerciseLocalDsImpl;

  ExerciseRepositoryImpl(this._exerciseLocalDsImpl);

  @override
  Future<Exercise> create(Exercise exercise) {
    return _exerciseLocalDsImpl.create(exercise);
  }

  @override
  Future<Exercise> delete(Exercise exercise) {
    return _exerciseLocalDsImpl.delete(exercise);
  }

  @override
  Future<List<Exercise>> getAll() {
    return _exerciseLocalDsImpl.getAll();
  }

  @override
  Future<Exercise> update(Exercise exercise) {
    return _exerciseLocalDsImpl.update(exercise);
  }
}

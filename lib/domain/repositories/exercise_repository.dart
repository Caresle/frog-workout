import 'package:workouts_app/domain/domain.dart';

abstract class ExerciseRepository {
  Future<List<Exercise>> getAll();
  Future<Exercise> create(Exercise exercise);
  Future<Exercise> update(Exercise exercise);
  Future<Exercise> delete(Exercise exercise);
  Future<List<Exercise>> getToSync();
}

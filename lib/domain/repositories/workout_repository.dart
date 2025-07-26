import 'package:workouts_app/domain/domain.dart';

abstract class WorkoutRepository {
  Future<List<Workout>> getAll();
  Future<Workout> create(Workout workout);
  Future<Workout> update(Workout workout);
  Future<Workout> delete(Workout workout);
}

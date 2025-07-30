import 'package:workouts_app/domain/domain.dart';

abstract class WorkoutLocalDs {
  Future<Workout> create(Workout workout);
  Future<Workout> update(Workout workout);
  Future<Workout> delete(Workout workout);
  Future<List<Workout>> getAll();

  // Workout detail
  Future<void> addExercise(int workoutId, List<Exercise> exercises);
  Future<void> removeExercise(int workoutId, List<Exercise> exercises);
}

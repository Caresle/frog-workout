import 'package:workouts_app/domain/domain.dart';

abstract class WorkoutLocalDs {
  Future<Workout> create(Workout workout);
  Future<Workout> update(Workout workout);
  Future<Workout> delete(Workout workout);
  Future<List<Workout>> getAll();

  // Workout detail
  Future<void> addExercise(String workoutId, List<Exercise> exercises);
  Future<void> removeExercise(String workoutId, List<Exercise> exercises);

  // Sets
  Future<void> addSet(
    String workoutId,
    int exerciseId,
    List<WorkoutDetail> details,
  );

  Future<void> updateSet(WorkoutDetail detail);
}

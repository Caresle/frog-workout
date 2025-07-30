import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';

class WorkoutRepositoryImpl extends WorkoutRepository {
  final WorkoutLocalDs _workoutLocalDsImpl;

  WorkoutRepositoryImpl(this._workoutLocalDsImpl);

  @override
  Future<Workout> create(Workout workout) {
    return _workoutLocalDsImpl.create(workout);
  }

  @override
  Future<Workout> delete(Workout workout) {
    return _workoutLocalDsImpl.delete(workout);
  }

  @override
  Future<List<Workout>> getAll() {
    return _workoutLocalDsImpl.getAll();
  }

  @override
  Future<Workout> update(Workout workout) {
    return _workoutLocalDsImpl.update(workout);
  }

  @override
  Future<void> addExercise(int workoutId, List<Exercise> exercises) {
    return _workoutLocalDsImpl.addExercise(workoutId, exercises);
  }

  @override
  Future<void> removeExercise(int workoutId, List<Exercise> exercises) {
    return _workoutLocalDsImpl.removeExercise(workoutId, exercises);
  }

  @override
  Future<void> addSet(
    int workoutId,
    int exerciseId,
    List<WorkoutDetail> details,
  ) {
    return _workoutLocalDsImpl.addSet(workoutId, exerciseId, details);
  }
}

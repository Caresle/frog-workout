import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';

class WorkoutsProvider extends ChangeNotifier {
  final WorkoutRepository _repository;

  WorkoutsProvider(this._repository);

  List<Workout> _workouts = [];
  bool _isLoading = false;

  List<Workout> get workouts => _workouts;
  bool get isLoading => _isLoading;

  Future<void> getAll() async {
    _isLoading = true;
    notifyListeners();
    _workouts = await _repository.getAll();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> create(Workout workout) async {
    _isLoading = true;
    notifyListeners();
    await _repository.create(workout);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> delete(Workout workout) async {
    await _repository.delete(workout);
    await getAll();
  }

  Future<void> addExercise(int workoutId, List<Exercise> exercises) async {
    await _repository.addExercise(workoutId, exercises);
    await getAll();
    notifyListeners();
  }

  Future<void> removeExercise(int workoutId, List<Exercise> exercises) async {
    await _repository.removeExercise(workoutId, exercises);
    await getAll();
    notifyListeners();
  }

  Future<void> addSet(
    int workoutId,
    int exerciseId,
    List<WorkoutDetail> details,
  ) async {
    await _repository.addSet(workoutId, exerciseId, details);
    await getAll();
    notifyListeners();
  }

  Future<void> updateSet(WorkoutDetail detail) async {
    await _repository.updateSet(detail);
    await getAll();
    notifyListeners();
  }
}

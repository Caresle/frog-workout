import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';

class WorkoutsProvider extends ChangeNotifier {
  final WorkoutRepository _repository;

  WorkoutsProvider(this._repository);

  List<Workout> _workouts = [];
  List<WorkoutDetail> _details = [];
  bool _isLoading = false;

  List<Workout> get workouts => _workouts;
  List<WorkoutDetail> get details => _details;
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
    await _repository.getAll();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> update(Workout workout) async {
    _isLoading = true;
    notifyListeners();
    await _repository.update(workout);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> delete(Workout workout) async {
    await _repository.delete(workout);
    await getAll();
    notifyListeners();
  }

  Future<void> addExercise(String workoutId, List<Exercise> exercises) async {
    await _repository.addExercise(workoutId, exercises);
    await getAll();
    notifyListeners();
  }

  Future<void> removeExercise(
    String workoutId,
    List<Exercise> exercises,
  ) async {
    await _repository.removeExercise(workoutId, exercises);
    await getAll();
    notifyListeners();
  }

  /// This method is used to add a new set for a given exercise, consider that
  /// this only will affect the current data in the UI, and not the local db.
  /// The reason is that we update/create everything after the user press the
  /// save button.
  Future<void> addSet(
    String workoutId,
    int exerciseId,
    List<WorkoutDetail> details,
  ) async {
    final Workout? workout = workouts.cast<Workout?>().firstWhere(
      (w) => w?.id == workoutId,
      orElse: () => null,
    );

    if (workout == null) {
      return;
    }

    final index = workouts.indexWhere((w) => w.id == workoutId);

    List<WorkoutDetail> newDetails = List.from(workout.details);
    newDetails.addAll(details);

    workouts[index] = workout.copyWith(details: newDetails);
    notifyListeners();
  }

  /// This method is used to update a set for a given exercise, consider that
  /// this only will affect the current data in the UI, and not the local db.
  Future<void> updateSet(WorkoutDetail detail) async {
    final Workout? workout = workouts.cast<Workout?>().firstWhere(
      (w) => w?.id == detail.idWorkout,
      orElse: () => null,
    );

    if (workout == null) {
      return;
    }

    final index = workouts.indexWhere((w) => w.id == detail.idWorkout);
    final indexDetail = workout.details.indexWhere((d) => d.id == detail.id);

    if (indexDetail == -1) {
      return;
    }

    List<WorkoutDetail> details = List.from(workout.details);
    details[indexDetail] = detail;

    workouts[index] = workout.copyWith(details: details);
    notifyListeners();
  }
}

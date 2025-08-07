import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';

class ExerciseProvider extends ChangeNotifier {
  final ExerciseRepository _repository;

  ExerciseProvider(this._repository);

  List<Exercise> _exercises = [];
  bool _isLoading = false;

  List<Exercise> get exercises => _exercises;
  bool get isLoading => _isLoading;

  Future<void> getAll() async {
    _isLoading = true;
    notifyListeners();
    _exercises = await _repository.getAll();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> create(Exercise exercise) async {
    try {
      await _repository.create(exercise);
      final exercises = await _repository.getAll();
      _exercises = exercises;
      notifyListeners();
    } catch (e) {
      print(e);
      notifyListeners();
    }
    // TODO: Implementes later, right now the local insertion
    // to the database is fast enough
    // final previousExercise = List<Exercise>.from(_exercises);
    // _exercises.add(exercise);

    // notifyListeners();

    // try {
    //   final created = await _repository.create(exercise);
    //   final index = _exercises.indexWhere((e) => e.id == exercise.id);

    //   _exercises[index] = created;
    //   notifyListeners();
    // } catch (e) {
    //   _exercises = previousExercise;
    //   notifyListeners();
    // }
  }

  Future<void> update(Exercise exercise) async {
    _isLoading = true;
    notifyListeners();
    await _repository.update(exercise);
    final exercises = await _repository.getAll();
    _exercises = exercises;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> delete(Exercise exercise) async {
    await _repository.delete(exercise);
    final exercises = await _repository.getAll();
    _exercises = exercises;
    notifyListeners();

    // TODO: Implementes later, right now the local insertion
    // to the database is fast enough
    // final previousExercises = List<Exercise>.from(_exercises);
    // _exercises.removeWhere((e) => e.id == exercise.id);

    // notifyListeners();

    // try {
    //   await _repository.delete(exercise);
    // } catch (e) {
    //   _exercises = previousExercises;
    //   notifyListeners();
    // }
  }
}

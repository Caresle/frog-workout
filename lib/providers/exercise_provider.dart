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
    _isLoading = true;
    notifyListeners();
    await _repository.create(exercise);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> update(Exercise exercise) async {
    _isLoading = true;
    notifyListeners();
    await _repository.update(exercise);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> delete(Exercise exercise) async {
    _isLoading = true;
    notifyListeners();
    await _repository.delete(exercise);
    _isLoading = false;
    notifyListeners();
  }
}

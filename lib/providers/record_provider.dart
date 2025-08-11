import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';

class RecordProvider extends ChangeNotifier {
  final RecordRepository _repository;

  List<WorkoutRecord> records = [];
  bool isLoading = false;

  RecordProvider(this._repository);

  Future<void> getRecords() async {
    isLoading = true;
    notifyListeners();
    records = await _repository.getAll();
    isLoading = false;
    notifyListeners();
  }
}

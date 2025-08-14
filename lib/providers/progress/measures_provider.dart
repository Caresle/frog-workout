import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';

class MeasuresProvider extends ChangeNotifier {
  final MeasuresRepository _repository;
  List<Measures> _measures = [];

  List<Measures> get measures => _measures;

  MeasuresProvider(this._repository);

  Future<void> addMeasure(Measures measures) async {
    await _repository.addMeasure(measures);
    await getMeasures();
  }

  Future<void> deleteMeasure(Measures measures) async {
    await _repository.deleteMeasure(measures);
    notifyListeners();
  }

  Future<void> getMeasures() async {
    _measures = await _repository.getMeasures();
    notifyListeners();
  }

  Future<void> updateMeasure(Measures measures) async {
    await _repository.updateMeasure(measures);
    notifyListeners();
  }
}

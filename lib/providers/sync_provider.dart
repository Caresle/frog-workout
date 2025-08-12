import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';

class SyncProvider extends ChangeNotifier {
  final SyncRepository _repository;

  SyncProvider(this._repository);

  Future<bool> syncWorkoutsRecords(List<WorkoutRecord> records) async {
    return _repository.syncWorkoutsRecords(records);
  }

  Future<bool> syncWorkouts(List<Workout> workouts) async {
    return _repository.syncWorkouts(workouts);
  }
}

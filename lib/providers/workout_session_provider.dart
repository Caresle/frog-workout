import 'package:flutter/material.dart';
import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';

class WorkoutSessionProvider extends ChangeNotifier {
  RecordRepository recordRepository;
  Workout workout;
  List<WorkoutDetailUi> details = [];

  WorkoutSessionProvider({
    required this.workout,
    required this.recordRepository,
  }) {
    details = workout.details
        .map((d) => WorkoutDetailUi.fromWorkoutDetail(d))
        .toList();
  }

  void updateWorkout(Workout newWorkout) {
    workout = newWorkout;
    details = workout.details
        .map((d) => WorkoutDetailUi.fromWorkoutDetail(d))
        .toList();
    notifyListeners();
  }

  void updateDetails(WorkoutDetailUi detail) {
    final index = details.indexWhere((d) => d.detail.id == detail.detail.id);
    if (index == -1) return;

    details[index] = detail;
    notifyListeners();
  }

  bool validateSession() {
    final hasInvalidDetails = details.any((detail) => !detail.isComplete);

    if (hasInvalidDetails) {
      return false;
    }

    return true;
  }

  Future<void> finishWorkout({saveInvalidSets = false}) async {
    final detailsToSave = details.where(
      (detail) => detail.isComplete || saveInvalidSets,
    );

    final records = detailsToSave.map((detail) {
      return WorkoutRecordMapper.fromWorkoutDetailUi(detail);
    }).toList();

    await recordRepository.create(records);
  }
}

import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';

class WorkoutSessionProvider extends ChangeNotifier {
  Workout workout;
  List<WorkoutDetailUi> details = [];

  WorkoutSessionProvider({required this.workout}) {
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
}

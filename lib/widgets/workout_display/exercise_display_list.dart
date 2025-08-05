import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseDisplayList extends StatelessWidget {
  final Workout workout;
  final void Function(int duration)? onStartTimer;

  const ExerciseDisplayList({
    super.key,
    required this.workout,
    this.onStartTimer,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: workout.exercises.length,
      itemBuilder: (context, index) {
        final exercise = workout.exercises[index];
        final details = workout.details
            .where((d) => d.idExercise == exercise.id)
            .map((d) => WorkoutDetailUi.fromWorkoutDetail(d))
            .toList();

        return ExerciseDisplayItem(
          exercise: exercise,
          details: details,
          onStartTimer: onStartTimer,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseDisplayList extends StatelessWidget {
  final void Function(int duration)? onStartTimer;

  const ExerciseDisplayList({super.key, this.onStartTimer});

  @override
  Widget build(BuildContext context) {
    final workoutSessionProvider = context.watch<WorkoutSessionProvider>();
    final workout = workoutSessionProvider.workout;
    final detailsSession = workoutSessionProvider.details;

    return ListView.builder(
      itemCount: workout.exercises.length,
      itemBuilder: (context, index) {
        final exercise = workout.exercises[index];
        final details = detailsSession
            .where((d) => d.detail.idExercise == exercise.id)
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

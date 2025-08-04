import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseDisplayList extends StatelessWidget {
  final Workout workout;

  const ExerciseDisplayList({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: workout.exercises.length,
      itemBuilder: (context, index) {
        final exercise = workout.exercises[index];
        final details = workout.details
            .where((d) => d.idExercise == exercise.id)
            .toList();

        return ExerciseDisplayItem(exercise: exercise, details: details);
      },
    );
  }
}

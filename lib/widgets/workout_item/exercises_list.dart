import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExercisesList extends StatelessWidget {
  final Workout workout;

  const ExercisesList({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    final totalExercises = workout.exercises.length;

    if (totalExercises == 0) {
      return Flexible(
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_rounded),
              SizedBox(height: 4),
              Text('No exercises'),
            ],
          ),
        ),
      );
    }

    return Flexible(
      child: ListView.builder(
        itemCount: totalExercises,
        itemBuilder: (context, index) {
          final exercise = workout.exercises[index];
          final details = workout.details
              .where((d) => d.idExercise == exercise.id)
              .toList();

          return Provider.value(
            value: (exercise, details),
            child: ExerciseDetail(),
          );
        },
      ),
    );
  }
}

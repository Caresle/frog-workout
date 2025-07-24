import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    final providerExercise = context.watch<ExerciseProvider>();

    if (providerExercise.isLoading) {
      return Flexible(
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading exercises...'),
            ],
          ),
        ),
      );
    }

    if (!providerExercise.isLoading && providerExercise.exercises.isEmpty) {
      return Flexible(
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.info_rounded), Text('No exercises')],
          ),
        ),
      );
    }

    return Flexible(
      child: ListView.builder(
        itemCount: providerExercise.exercises.length,
        itemBuilder: (context, index) {
          return ExerciseItem();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class WorkoutDisplayScreen extends StatelessWidget {
  final String id;
  const WorkoutDisplayScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final workouts = context.watch<WorkoutsProvider>().workouts;
    final workout = workouts.cast<Workout?>().firstWhere(
      (w) => w?.id == id,
      orElse: () => null,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(workout?.name ?? ""),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FilledButton(onPressed: () {}, child: Text('Finish')),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: workout == null
              ? Center(child: const Text('Workout not found'))
              : Column(
                  children: [
                    Flexible(child: ExerciseDisplayList(workout: workout)),
                  ],
                ),
        ),
      ),
    );
  }
}

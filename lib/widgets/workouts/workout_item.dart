import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/widgets/widgets.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    final workout = context.watch<Workout>();
    final totalExercises = workout.exercises.length;
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              context.push('/workouts/${workout.id}');
            },
            title: WorkoutTitle(workout: workout),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Workout description'),
                const SizedBox(height: 8),
                totalExercises > 0
                    ? Text('Total exercises: $totalExercises')
                    : const SizedBox(),
                const SizedBox(height: 8),
                StartWorkout(id: workout.id),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

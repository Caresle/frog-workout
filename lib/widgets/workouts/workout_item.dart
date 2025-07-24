import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouts_app/widgets/widgets.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              context.push('/workouts/1');
            },
            title: WorkoutTitle(),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Workout description'),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: () {
                    context.push('/workouts/1/start');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.play_circle_rounded),
                      const SizedBox(width: 8),
                      Text('Start Workout'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

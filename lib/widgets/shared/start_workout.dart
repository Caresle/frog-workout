import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartWorkout extends StatelessWidget {
  const StartWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.push('/workouts/temp-1/start');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.play_circle_rounded),
          const SizedBox(width: 8),
          Text('Start Workout'),
        ],
      ),
    );
  }
}

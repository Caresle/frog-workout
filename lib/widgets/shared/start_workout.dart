import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartWorkout extends StatelessWidget {
  final String id;

  const StartWorkout({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        context.push('/workouts/$id/start');
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

import 'package:flutter/material.dart';

class StartWorkout extends StatelessWidget {
  const StartWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {},
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

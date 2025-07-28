import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewWorkoutButton extends StatelessWidget {
  const NewWorkoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        context.push('/workouts/-1');
      },
      child: Row(
        children: [
          Icon(Icons.add_rounded),
          const SizedBox(width: 8),
          Text('New workout'),
        ],
      ),
    );
  }
}

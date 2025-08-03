import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouts_app/constants/app_constants.dart';

class NewWorkoutButton extends StatelessWidget {
  const NewWorkoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        context.push(
          '/workouts/${AppConstants.newItemIdPrefix}${DateTime.now().microsecondsSinceEpoch}',
        );
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

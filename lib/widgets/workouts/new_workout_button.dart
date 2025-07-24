import 'package:flutter/material.dart';

class NewWorkoutButton extends StatelessWidget {
  const NewWorkoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {},
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

import 'package:flutter/material.dart';

class ExerciseDetailHeader extends StatelessWidget {
  const ExerciseDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.fitness_center_rounded),
            const SizedBox(width: 8),
            Text('Exercise'),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_rounded)),
      ],
    );
  }
}

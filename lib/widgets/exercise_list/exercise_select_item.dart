import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';

class ExerciseSelectItem extends StatelessWidget {
  final bool isSelected;
  final void Function()? onTap;
  final Exercise exercise;

  const ExerciseSelectItem({
    super.key,
    this.isSelected = false,
    this.onTap,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: isSelected ? Colors.blue : null,
      child: ListTile(
        onTap: onTap,
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.blue.shade800
                    : Colors.blueGrey.shade900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.fitness_center_rounded,
                size: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            Text(exercise.name),
          ],
        ),
      ),
    );
  }
}

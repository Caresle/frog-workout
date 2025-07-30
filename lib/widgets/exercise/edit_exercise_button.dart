import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouts_app/config/theme/theme.dart';
import 'package:workouts_app/domain/domain.dart';

class EditExerciseButton extends StatelessWidget {
  final Exercise exercise;
  const EditExerciseButton({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: AppStyle.filledSecondaryGhost,
      onPressed: () {
        context.push('/exercises/${exercise.id}');
      },
      child: Row(children: [Icon(Icons.edit_rounded), Text('Edit Exercise')]),
    );
  }
}

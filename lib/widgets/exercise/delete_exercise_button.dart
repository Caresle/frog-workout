import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouts_app/config/theme/theme.dart';

class DeleteExerciseButton extends StatelessWidget {
  final void Function(BuildContext innerContext) onConfirm;

  const DeleteExerciseButton({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: AppStyle.filledDangerGhost,
      onPressed: () {
        context.pop();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text('Are you sure you want to delete this exercise?'),
            actions: [
              TextButton(
                onPressed: () {
                  // Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  onConfirm(context);
                  // Navigator.of(context).pop();
                },
                child: Text('Delete'),
              ),
            ],
          ),
        );
      },
      child: Row(
        children: [Icon(Icons.delete_rounded), Text('Delete Exercise')],
      ),
    );
  }
}

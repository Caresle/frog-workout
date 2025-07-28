import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/config/theme/theme.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';

class WorkoutTitle extends StatelessWidget {
  final Workout workout;

  const WorkoutTitle({super.key, required this.workout});

  void onEdit(BuildContext context) {
    context.push('/workouts/${workout.id}');
  }

  void onDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (contextDialog) {
        return AlertDialog(
          content: Text('Are you sure you want to delete this workout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(contextDialog).pop();
              },
              child: Text('Cancel'),
            ),
            FilledButton(
              style: AppStyle.filledDanger,
              onPressed: () async {
                final provider = contextDialog.read<WorkoutsProvider>();
                await provider.delete(workout);
                if (contextDialog.mounted) {
                  Navigator.of(contextDialog).pop();
                }
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(workout.name),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return _WorkoutActions(
                  onEdit: () => onEdit(context),
                  onDelete: () => onDelete(context),
                );
              },
            );
          },
          icon: Icon(Icons.more_horiz_rounded),
        ),
      ],
    );
  }
}

class _WorkoutActions extends StatelessWidget {
  final void Function() onEdit;
  final void Function() onDelete;

  const _WorkoutActions({required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: deviceSize.height * .7,
        width: deviceSize.width - 16,
        child: Column(
          children: [
            Text('Actions', style: TextStyle(fontSize: 16)),
            FilledButton.tonal(
              onPressed: () {
                context.pop();
                onEdit();
              },
              style: AppStyle.filledSecondaryGhost,
              child: Row(
                children: [
                  Icon(Icons.edit_rounded),
                  const SizedBox(width: 8),
                  Text('Edit Workout'),
                ],
              ),
            ),
            FilledButton.tonal(
              onPressed: () {
                context.pop();
                onDelete();
              },
              style: AppStyle.filledDangerGhost,
              child: Row(
                children: [
                  Icon(Icons.delete_rounded),
                  const SizedBox(width: 8),
                  Text('Delete Workout'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

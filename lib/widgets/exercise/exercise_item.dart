import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final exercise = context.watch<Exercise>();

    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: () {
          context.push('/exercises/${exercise.id}');
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(exercise.name), getActionsMenu(context, deviceSize)],
        ),
        subtitle: Row(
          children: [Chip(label: Text(exercise.weightType.name.toUpperCase()))],
        ),
      ),
    );
  }

  Widget getActionsMenu(BuildContext context, Size deviceSize) {
    final exercise = context.read<Exercise>();

    return Provider.value(
      value: exercise,
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: deviceSize.width - 16,
                  height: deviceSize.height * .7,
                  child: Column(
                    children: [
                      Text('Actions', style: TextStyle(fontSize: 16)),
                      _DeleteExercise(
                        onConfirm: (BuildContext innerContext) {
                          if (innerContext.mounted) {
                            innerContext.read<ExerciseProvider>().delete(
                              exercise,
                            );
                            innerContext.pop();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        icon: Icon(Icons.more_horiz_rounded),
      ),
    );
  }
}

class _DeleteExercise extends StatelessWidget {
  final void Function(BuildContext innerContext) onConfirm;
  const _DeleteExercise({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.red.shade200.withAlpha(40),
        foregroundColor: Colors.red.shade400,
      ),
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

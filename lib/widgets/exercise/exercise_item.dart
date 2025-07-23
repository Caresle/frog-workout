import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: () {
          context.push('/exercises/1');
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Exercise name'),
            getActionsMenu(context, deviceSize),
          ],
        ),
        subtitle: Row(children: [Chip(label: const Text('KG'))]),
      ),
    );
  }

  IconButton getActionsMenu(BuildContext context, Size deviceSize) {
    return IconButton(
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
                    _DeleteExercise(),
                  ],
                ),
              ),
            );
          },
        );
      },
      icon: Icon(Icons.more_horiz_rounded),
    );
  }
}

class _DeleteExercise extends StatelessWidget {
  const _DeleteExercise();

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
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
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

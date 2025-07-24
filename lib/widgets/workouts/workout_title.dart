import 'package:flutter/material.dart';

class WorkoutTitle extends StatelessWidget {
  const WorkoutTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Workout name'),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return _WorkoutActions();
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
  const _WorkoutActions();

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
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade200.withAlpha(40),
                foregroundColor: Colors.blueGrey.shade200,
              ),
              child: Row(
                children: [
                  Icon(Icons.edit_rounded),
                  const SizedBox(width: 8),
                  Text('Edit Workout'),
                ],
              ),
            ),
            FilledButton.tonal(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red.shade200.withAlpha(40),
                foregroundColor: Colors.red.shade400,
              ),
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

import 'package:flutter/material.dart';

class ProgressWorkoutList extends StatelessWidget {
  const ProgressWorkoutList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            child: ListTile(
              title: Row(
                children: [
                  Icon(Icons.timer_rounded),
                  const SizedBox(width: 8),
                  Text('Item $index'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

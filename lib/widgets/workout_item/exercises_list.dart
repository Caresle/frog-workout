import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExercisesList extends StatelessWidget {
  const ExercisesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: ExerciseDetailHeader(),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExerciseDetailRestTime(),
                  Row(
                    children: [
                      Text('Set'),
                      const SizedBox(width: 4),
                      Text('Weight'),
                      const SizedBox(width: 4),
                      Text('Reps'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('W'),
                      const SizedBox(width: 4),
                      Text('20'),
                      const SizedBox(width: 4),
                      Text('10'),
                    ],
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.add_rounded),
                        const SizedBox(width: 8),
                        Text('Add set'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

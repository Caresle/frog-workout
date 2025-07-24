import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseDetail extends StatelessWidget {
  const ExerciseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: ExerciseDetailHeader(),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExerciseDetailRestTime(),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [Text('Set Type'), Text('Weight'), Text('Reps')],
                ),
                TableRow(
                  children: [
                    SetTypeDisplay(setType: SetType.warmup),
                    Text('10 Kg'),
                    Text('10'),
                  ],
                ),
                TableRow(
                  children: [SetTypeDisplay(), Text('10 Kg'), Text('10')],
                ),
                TableRow(
                  children: [
                    SetTypeDisplay(setType: SetType.failure),
                    Text('10 Kg'),
                    Text('10'),
                  ],
                ),
                TableRow(
                  children: [
                    SetTypeDisplay(setType: SetType.backoff),
                    Text('10 Kg'),
                    Text('10'),
                  ],
                ),
                TableRow(
                  children: [
                    SetTypeDisplay(setType: SetType.top),
                    Text('10 Kg'),
                    Text('10'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade900.withAlpha(20),
              ),
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
  }
}

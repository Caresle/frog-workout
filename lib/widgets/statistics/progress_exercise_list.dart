import 'package:flutter/material.dart';
import 'package:workouts_app/domain/domain.dart';

class ProgressExerciseList extends StatelessWidget {
  const ProgressExerciseList({super.key, required this.records});

  final List<WorkoutRecord> records;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        final title = '${record.weight} ${record.weightType} x ${record.reps}';
        return Card(
          child: ListTile(
            title: Row(
              children: [
                Text(record.setType[0].toUpperCase()),
                const SizedBox(width: 8),
                Text(title),
              ],
            ),
          ),
        );
      },
    );
  }
}

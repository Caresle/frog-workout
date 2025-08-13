import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ShowStatisticsOfExercise extends StatelessWidget {
  final Exercise exercise;

  const ShowStatisticsOfExercise({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final records = context.watch<StatisticsProvider>().recordsByExercise;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(exercise.name),
        const SizedBox(height: 8),
        ChartProgress(),
        const SizedBox(height: 8),
        ChartConditionSelector(),
        Text('Progress'),
        const SizedBox(height: 8),
        ProgressExerciseList(records: records),
      ],
    );
  }
}

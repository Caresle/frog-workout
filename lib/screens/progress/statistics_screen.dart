import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final statisticsProvider = context.watch<StatisticsProvider>();
    final exercises = context.watch<ExerciseProvider>().exercises;

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text('Progress by exercise'),
              const SizedBox(height: 16),
              DropdownMenu(
                label: const Text('Selected Exercise'),
                width: size.width - 16,
                initialSelection: statisticsProvider.selectedExercise?.id,
                onSelected: (value) {
                  if (value == null) return;
                  final exercise = exercises.firstWhere(
                    (e) => e.id == value,
                    orElse: () => Exercise.empty(),
                  );

                  final recordProvider = context.read<RecordProvider>();

                  statisticsProvider.updateExercise(exercise, recordProvider);
                },
                dropdownMenuEntries: [
                  ...exercises.map((exercise) {
                    return DropdownMenuEntry(
                      label: exercise.name,
                      value: exercise.id,
                    );
                  }),
                ],
              ),
              const SizedBox(height: 16),
              statisticsProvider.selectedExercise == null
                  ? SelectExerciseAlert()
                  : ShowStatisticsOfExercise(
                      exercise: statisticsProvider.selectedExercise!,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

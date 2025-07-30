import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/models/models.dart';
import 'package:workouts_app/providers/workouts_provider.dart';

class ExerciseDetailHeader extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailHeader({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final (workout, _, _) = context.read<WorkoutItemUI>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.fitness_center_rounded),
            const SizedBox(width: 8),
            Text(exercise.name),
          ],
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: deviceSize.width,
                    height: deviceSize.height * 0.4,
                    child: Column(
                      children: [
                        const Text('Actions'),
                        const SizedBox(height: 16),
                        FilledButton.tonal(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.swap_vert_rounded),
                              const SizedBox(width: 8),
                              Text('Reorder'),
                            ],
                          ),
                        ),
                        FilledButton.tonal(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.edit_rounded),
                              const SizedBox(width: 8),
                              Text('Replace Exercise'),
                            ],
                          ),
                        ),
                        FilledButton.tonal(
                          onPressed: () async {
                            await context
                                .read<WorkoutsProvider>()
                                .removeExercise(workout.id, [exercise]);

                            if (!context.mounted) return;
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            children: [
                              Icon(Icons.close_rounded),
                              const SizedBox(width: 8),
                              Text('Remove Exercise'),
                            ],
                          ),
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
      ],
    );
  }
}

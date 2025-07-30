import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/config/theme/theme.dart';
import 'package:workouts_app/constants/app_constants.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/models/models.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseDetail extends StatelessWidget {
  const ExerciseDetail({super.key});

  Widget getWeightDisplay(Exercise exercise) {
    final text = exercise.weightType == WeightType.kg ? 'Kg' : 'Lbs';

    return Row(
      children: [
        Icon(Icons.fitness_center_rounded, size: 16),
        const SizedBox(width: 3),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final (workout, exercise, details) = context.read<WorkoutItemUI>();

    return Card(
      child: ListTile(
        title: ExerciseDetailHeader(exercise: exercise),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExerciseDetailRestTime(),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Text('Set Type'),
                    getWeightDisplay(exercise),
                    Text('Reps'),
                  ],
                ),
                ...details.map(
                  (detail) => TableRow(
                    children: [
                      SetTypeDisplay(setType: detail.setType),
                      Text('${detail.weight}'),
                      Text('${detail.reps}'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: AppStyle.elevatedButtonSecondary,
              onPressed: () async {
                final WorkoutDetail detail = WorkoutDetail(
                  id: AppConstants.newItemId,
                  idWorkout: workout.id,
                  idExercise: exercise.id,
                );

                await context.read<WorkoutsProvider>().addSet(
                  workout.id,
                  exercise.id,
                  [detail],
                );
              },
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

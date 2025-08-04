import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/config/theme/theme.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/models/models.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

/// Widget used to display the details of an exercise inside a workout
/// and to allow the user to edit the exercise's details.

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
                ...details.asMap().entries.map((entry) {
                  final detail = entry.value;
                  return TableRow(
                    children: [
                      SetTypeDisplay(setType: detail.setType, detail: detail),
                      TextFormField(
                        onChanged: (value) {
                          try {
                            final newDetail = detail.copyWith(
                              weight: double.parse(value),
                            );

                            context.read<WorkoutsProvider>().updateSet(
                              newDetail,
                            );
                          } catch (e) {
                            return;
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'),
                          ),
                        ],
                        decoration: InputDecoration(border: InputBorder.none),
                        initialValue: detail.weight.toString(),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          try {
                            final newDetail = detail.copyWith(
                              reps: double.parse(value),
                            );

                            context.read<WorkoutsProvider>().updateSet(
                              newDetail,
                            );
                          } catch (e) {
                            return;
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'),
                          ),
                        ],
                        decoration: InputDecoration(border: InputBorder.none),
                        initialValue: detail.reps.toString(),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  );
                }),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: AppStyle.elevatedButtonSecondary,
              onPressed: () async {
                final WorkoutDetail detail = WorkoutDetail(
                  id: 'temp-${DateTime.now().millisecondsSinceEpoch}',
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

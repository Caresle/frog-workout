import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workouts_app/config/theme/theme.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseDisplayItem extends StatelessWidget {
  final Exercise exercise;
  final List<WorkoutDetailUi> details;
  final void Function(int duration)? onStartTimer;

  const ExerciseDisplayItem({
    super.key,
    required this.exercise,
    required this.details,
    this.onStartTimer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: _Header(exercise: exercise),
        subtitle: Column(
          children: [
            ExerciseDetailRestTime(),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Text('Set Type', textAlign: TextAlign.center),
                    Text('Kg', textAlign: TextAlign.center),
                    Text('Reps', textAlign: TextAlign.center),
                    Icon(Icons.check_rounded),
                  ],
                ),
                ...details.asMap().entries.map((entry) {
                  final detail = entry.value.detail;
                  final isComplete = entry.value.isComplete;

                  return TableRow(
                    children: [
                      WrapperCell(
                        isComplete: isComplete,
                        isFirst: true,
                        child: SetTypeDisplay(detail: detail),
                      ),
                      WrapperCell(
                        isComplete: isComplete,
                        child: TextFormField(
                          initialValue: '${detail.weight}',
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}'),
                            ),
                          ],
                        ),
                      ),
                      WrapperCell(
                        isComplete: isComplete,
                        child: TextFormField(
                          initialValue: '${detail.reps}',
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}'),
                            ),
                          ],
                        ),
                      ),
                      WrapperCell(
                        isLast: true,
                        isComplete: isComplete,
                        child: Checkbox(
                          value: isComplete,
                          onChanged: (_) {
                            if (isComplete) return;
                            onStartTimer?.call(detail.restTime);
                          },
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
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

class _Header extends StatelessWidget {
  final Exercise exercise;
  const _Header({required this.exercise});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.fitness_center_rounded),
              ),
            ),
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
                    height: deviceSize.height * 0.8,
                    width: deviceSize.width,
                    child: Column(
                      children: [
                        FilledButton(
                          style: AppStyle.filledDangerHighGhost,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(Icons.close_rounded),
                              const SizedBox(width: 8),
                              Text('Remove exercise'),
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

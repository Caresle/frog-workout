import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseDisplayItem extends StatelessWidget {
  const ExerciseDisplayItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: _Header(),
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
                TableRow(
                  children: [
                    SetTypeDisplay(),
                    Text('10', textAlign: TextAlign.center),
                    Text('20', textAlign: TextAlign.center),
                    Checkbox(value: true, onChanged: (_) {}),
                  ],
                ),
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
  const _Header();

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
            Text('Exercise'),
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
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.red.shade900.withAlpha(30),
                            foregroundColor: Colors.red.shade500,
                          ),
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

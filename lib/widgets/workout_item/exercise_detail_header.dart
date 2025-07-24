import 'package:flutter/material.dart';

class ExerciseDetailHeader extends StatelessWidget {
  const ExerciseDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.fitness_center_rounded),
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
                          onPressed: () {},
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

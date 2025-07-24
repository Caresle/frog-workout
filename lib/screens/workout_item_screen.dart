import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class WorkoutItemScreen extends StatelessWidget {
  final int id;

  const WorkoutItemScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Workout $id'),
        actions: [
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
                                Icon(Icons.copy_rounded),
                                const SizedBox(width: 8),
                                Text('Duplicate Workout'),
                              ],
                            ),
                          ),
                          FilledButton.tonal(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.delete_rounded),
                                const SizedBox(width: 8),
                                Text('Delete Workout'),
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
            icon: const Icon(Icons.more_horiz_rounded),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StartWorkout(),
              const SizedBox(height: 16),
              Text('Exercises'),
              const SizedBox(height: 16),
              ExercisesList(),
              FilledButton.tonal(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.add_rounded),
                    const SizedBox(width: 8),
                    Text('Add exercise'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

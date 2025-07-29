import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/constants/app_constants.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class WorkoutItemScreen extends StatelessWidget {
  final int id;

  const WorkoutItemScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final workout = context.read<WorkoutsProvider>().workouts.firstWhere(
      (w) => w.id == id,
      orElse: () => Workout.empty(),
    );
    final isValidWorkout = workout.exercises.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: id == AppConstants.newItemId
            ? Text('New workout')
            : Text('Workout $id'),
        actions: [getTopActions(context, deviceSize)],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isValidWorkout ? StartWorkout() : const SizedBox(),
              const SizedBox(height: 16),
              ExercisesList(workout: workout),
              FilledButton.tonal(
                onPressed: () {
                  context.push('/exercises/list');
                },
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

  Widget getTopActions(BuildContext context, Size deviceSize) {
    if (id == AppConstants.newItemId) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilledButton(onPressed: () {}, child: Text('Save')),
      );
    }

    return IconButton(
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
    );
  }
}

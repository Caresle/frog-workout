import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/constants/app_constants.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class WorkoutItemScreen extends StatefulWidget {
  final String id;

  const WorkoutItemScreen({super.key, required this.id});

  @override
  State<WorkoutItemScreen> createState() => _WorkoutItemScreenState();
}

class _WorkoutItemScreenState extends State<WorkoutItemScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.id.contains(AppConstants.newItemIdPrefix)) {
      return;
    }

    final workout = Provider.of<WorkoutsProvider>(context, listen: false)
        .workouts
        .firstWhere(
          (w) => w.id == widget.id,
          orElse: () => Workout.empty().copyWith(id: widget.id),
        );

    _nameController.text = workout.name;
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final workout = context.watch<WorkoutsProvider>().workouts.firstWhere(
      (w) => w.id == widget.id,
      orElse: () => Workout.empty().copyWith(id: widget.id),
    );
    final isValidWorkout =
        !workout.id.contains(AppConstants.newItemIdPrefix) &&
        workout.exercises.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            if (widget.id.contains(AppConstants.newItemIdPrefix)) {
              await context.read<WorkoutsProvider>().delete(workout);
              if (!context.mounted) return;
            }

            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: TextFormField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: 'Name',
            border: InputBorder.none,
          ),
        ),
        actions: [getTopActions(context, deviceSize)],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isValidWorkout ? StartWorkout(id: widget.id) : const SizedBox(),
              const SizedBox(height: 16),
              ExercisesList(workout: workout),
              FilledButton.tonal(
                onPressed: () {
                  context.push('/exercises/list/${workout.id}');
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
    if (widget.id.contains(AppConstants.newItemIdPrefix)) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilledButton(
          onPressed: () async {
            final workoutsProvider = context.read<WorkoutsProvider>();
            final workouts = workoutsProvider.workouts;
            final workout = workouts.cast<Workout?>().firstWhere(
              (workout) => workout?.id == widget.id,
              orElse: () => null,
            );

            if (workout == null) return;

            final newWorkout = workout.copyWith(name: _nameController.text);
            if (workout.id.contains(AppConstants.newItemIdPrefix)) {
              await workoutsProvider.create(newWorkout);
              // remove of the temp id workout
              await workoutsProvider.delete(workout);

              if (!context.mounted) return;
              Navigator.of(context).pop();
              return;
            }

            await workoutsProvider.update(newWorkout);
          },
          child: Text('Save'),
        ),
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

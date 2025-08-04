import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class WorkoutsList extends StatelessWidget {
  const WorkoutsList({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutsProvider = Provider.of<WorkoutsProvider>(context);

    if (workoutsProvider.isLoading) {
      return Flexible(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading workouts...'),
            ],
          ),
        ),
      );
    }

    if (!workoutsProvider.isLoading && workoutsProvider.workouts.isEmpty) {
      return Flexible(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.info_rounded), Text('No workouts')],
          ),
        ),
      );
    }

    return Flexible(
      child: ListView.builder(
        itemCount: workoutsProvider.workouts.length,
        itemBuilder: (context, index) {
          final workout = workoutsProvider.workouts[index];
          print('${workout.id} / ${workout.name}');

          return Provider.value(value: workout, child: WorkoutItem());
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class WorkoutDisplayScreen extends StatelessWidget {
  final String id;
  const WorkoutDisplayScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout name'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: FilledButton(onPressed: () {}, child: Text('Finish')),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [Flexible(child: ExerciseDisplayList())]),
        ),
      ),
    );
  }
}

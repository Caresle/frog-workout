import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

/// This screen is used to display a list of exercises
/// to be selected when creating a new workout or editing an existing one.
class ExerciseListScreen extends StatelessWidget {
  final GlobalKey<ExerciseSelectListState> exerciseSelectListKey = GlobalKey();

  ExerciseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercises List')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExerciseSelectList(key: exerciseSelectListKey),
              FilledButton(
                onPressed: () {
                  final Set<int>? selected = exerciseSelectListKey.currentState
                      ?.getSelectedExercises();

                  if (selected == null) return;

                  print(selected.length);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save_rounded),
                    const SizedBox(width: 8),
                    Text('Add to Workout'),
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

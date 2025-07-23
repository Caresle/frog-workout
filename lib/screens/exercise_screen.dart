import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewExerciseButton(),
              const SizedBox(height: 16),
              const Text(
                'List of exercises',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              ExerciseList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainNavigationBar(selectedIndex: 1),
    );
  }
}

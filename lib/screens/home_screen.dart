import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              NewWorkoutButton(),
              const Text("Workouts"),
              const SizedBox(height: 16),
              WorkoutsList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainNavigationBar(selectedIndex: 0),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Overall progress'),
              const SizedBox(height: 8),
              ProgressGeneralChart(),
              const SizedBox(height: 16),
              ProgressDashboardCards(),
              const SizedBox(height: 16),
              const Text('Workout History'),
              const SizedBox(height: 8),
              ProgressWorkoutList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainNavigationBar(selectedIndex: 2),
    );
  }
}

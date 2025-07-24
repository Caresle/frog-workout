import 'package:flutter/material.dart';

class WorkoutItemScreen extends StatelessWidget {
  final int id;

  const WorkoutItemScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workout $id')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Workout $id'),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.play_circle_rounded),
                    const SizedBox(width: 8),
                    Text('Start Workout'),
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

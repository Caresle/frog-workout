import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouts_app/widgets/widgets.dart';

class MeasuresScreen extends StatelessWidget {
  const MeasuresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measures'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/progress/measures/form');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text('Overview (placeholder chart)'),
              const SizedBox(height: 8),
              ProgressGeneralChart(),
              MeasuresList(),
            ],
          ),
        ),
      ),
    );
  }
}

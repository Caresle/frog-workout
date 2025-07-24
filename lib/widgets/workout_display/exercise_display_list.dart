import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseDisplayList extends StatelessWidget {
  const ExerciseDisplayList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return ExerciseDisplayItem();
      },
    );
  }
}

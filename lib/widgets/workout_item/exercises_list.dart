import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExercisesList extends StatelessWidget {
  const ExercisesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return ExerciseDetail();
        },
      ),
    );
  }
}

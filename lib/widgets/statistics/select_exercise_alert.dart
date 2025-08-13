import 'package:flutter/material.dart';

class SelectExerciseAlert extends StatelessWidget {
  const SelectExerciseAlert({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.fitness_center_rounded, size: 128, color: Colors.blueGrey),
          Text(
            'Select an exercise to see the progress',
            style: TextStyle(color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}

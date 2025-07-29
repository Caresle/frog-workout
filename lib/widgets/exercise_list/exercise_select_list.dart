import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseSelectList extends StatefulWidget {
  const ExerciseSelectList({super.key});

  @override
  State<ExerciseSelectList> createState() => ExerciseSelectListState();
}

class ExerciseSelectListState extends State<ExerciseSelectList> {
  Set<int> selectedExercises = {};

  void _onTap(int index) {
    if (selectedExercises.contains(index)) {
      selectedExercises.remove(index);
      setState(() {});
      return;
    }

    selectedExercises.add(index);
    setState(() {});
  }

  Set<int> getSelectedExercises() {
    return selectedExercises;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          final selected = selectedExercises.contains(index);
          return ExerciseSelectItem(
            isSelected: selected,
            onTap: () => _onTap(index),
          );
        },
      ),
    );
  }
}

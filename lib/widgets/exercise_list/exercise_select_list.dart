import 'dart:collection';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseSelectList extends StatefulWidget {
  const ExerciseSelectList({super.key});

  @override
  State<ExerciseSelectList> createState() => ExerciseSelectListState();
}

class ExerciseSelectListState extends State<ExerciseSelectList> {
  bool _isInit = false;

  HashMap<int, Exercise> selectedExercises = HashMap();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) return;
    final exercises = Provider.of<ExerciseProvider>(
      context,
      listen: false,
    ).exercises;

    if (exercises.isNotEmpty) {
      _isInit = true;
      return;
    }

    _isInit = true;
    Future.microtask(() {
      if (!mounted) return;

      final provider = Provider.of<ExerciseProvider>(context, listen: false);
      provider.getAll();
    });
  }

  void _onTap(int id, Exercise exercise) {
    if (selectedExercises.containsKey(id)) {
      selectedExercises.remove(id);
      setState(() {});
      return;
    }

    selectedExercises[id] = exercise;
    setState(() {});
  }

  List<Exercise> getSelectedExercises() {
    return List.from(selectedExercises.values);
  }

  @override
  Widget build(BuildContext context) {
    final exercisesProvider = context.watch<ExerciseProvider>();

    if (exercisesProvider.isLoading) {
      return Flexible(child: const Center(child: CircularProgressIndicator()));
    }

    return Flexible(
      child: ListView.builder(
        itemCount: exercisesProvider.exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercisesProvider.exercises[index];
          final selected = selectedExercises.containsKey(exercise.id);

          return ExerciseSelectItem(
            isSelected: selected,
            onTap: () => _onTap(exercise.id, exercise),
            exercise: exercise,
          );
        },
      ),
    );
  }
}

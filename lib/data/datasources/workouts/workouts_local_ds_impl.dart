import 'dart:collection';

import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/widgets/widgets.dart';

List<Workout> workoutList = [
  Workout(id: '1', name: 'Push / Pull', createdAt: DateTime(2025)),
  Workout(
    id: '2',
    name: 'Leg',
    createdAt: DateTime(2025),
    exercises: [
      Exercise(id: 1, name: 'Squat', weightType: WeightType.kg),
      Exercise(id: 2, name: 'Deadlift', weightType: WeightType.kg),
    ],
    details: [
      WorkoutDetail(
        id: '1',
        idWorkout: '2',
        idExercise: 1,
        setType: SetType.warmup,
      ),
      WorkoutDetail(
        id: '2',
        idWorkout: '2',
        idExercise: 1,
        weight: 10,
        reps: 10,
      ),
      WorkoutDetail(id: '3', idWorkout: '2', idExercise: 1),
    ],
  ),
];

class WorkoutLocalDsImpl extends WorkoutLocalDs {
  @override
  Future<Workout> create(Workout workout) {
    final newWorkout = workout.copyWith(
      id: 'new-${DateTime.now().microsecondsSinceEpoch}',
    );
    workoutList.add(newWorkout);

    return Future.value(workout);
  }

  @override
  Future<Workout> delete(Workout workout) {
    workoutList.removeWhere((w) => w.id == workout.id);
    return Future.value(workout);
  }

  @override
  Future<List<Workout>> getAll() async {
    // await Future.delayed(Duration(seconds: 2));
    return List<Workout>.of(workoutList);
  }

  @override
  Future<Workout> update(Workout workout) async {
    final index = workoutList.indexWhere((w) => w.id == workout.id);
    workoutList[index] = workout;
    return Future.value(workout);
  }

  @override
  Future<void> addExercise(String workoutId, List<Exercise> exercises) async {
    Workout workoutItem = workoutList.firstWhere(
      (w) => w.id == workoutId,
      orElse: () => Workout.empty().copyWith(id: workoutId),
    );

    HashMap<int, Exercise> exercisesMap = HashMap();

    for (var e in exercises) {
      exercisesMap[e.id] = e;
    }

    for (var e in workoutItem.exercises) {
      exercisesMap[e.id] = e;
    }

    workoutItem = workoutItem.copyWith(exercises: exercisesMap.values.toList());

    final index = workoutList.indexWhere((w) => w.id == workoutId);

    if (index == -1) {
      workoutList.add(workoutItem);
      return;
    }

    workoutList[index] = workoutItem;
  }

  @override
  Future<void> removeExercise(
    String workoutId,
    List<Exercise> exercises,
  ) async {
    Workout workoutItem = workoutList.firstWhere(
      (w) => w.id == workoutId,
      orElse: () => Workout.empty(),
    );
    final List<Exercise> workoutExercises = List.from(workoutItem.exercises);
    workoutExercises.removeWhere(
      (original) => exercises.any((e) => e.id == original.id),
    );
    workoutItem = workoutItem.copyWith(exercises: workoutExercises);

    final index = workoutList.indexWhere((w) => w.id == workoutId);

    if (index == -1) {
      workoutList.add(workoutItem);
      return;
    }

    workoutList[index] = workoutItem;
  }

  @override
  Future<void> addSet(
    String workoutId,
    int exerciseId,
    List<WorkoutDetail> details,
  ) async {
    Workout workoutItem = workoutList.firstWhere(
      (w) => w.id == workoutId,
      orElse: () => Workout.empty(),
    );

    final index = workoutList.indexWhere((w) => w.id == workoutId);

    if (index == -1) {
      return;
    }

    List<WorkoutDetail> newDetails = List.from(workoutItem.details);
    newDetails.addAll(details);

    workoutList[index] = workoutItem.copyWith(details: newDetails);
  }

  // TODO: Change the implementation to this method because
  // we are going to pass a List<WorkoutDetail> instead of a WorkoutDetail
  // Because we are going to do optimistic updates in the ui and then send
  // the final data to the local db to be saved after all the modifications
  // are done.
  @override
  Future<void> updateSet(WorkoutDetail detail) async {
    final workout = workoutList.firstWhere(
      (w) => w.id == detail.idWorkout,
      orElse: () => Workout.empty(),
    );
    final index = workout.details.indexWhere((d) => d.id == detail.id);

    if (index == -1) {
      return;
    }

    final details = workout.details;

    final detailIndex = details.indexWhere((d) => d.id == detail.id);
    details[detailIndex] = detail;

    workoutList[index] = workout.copyWith(details: details);
  }
}

import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/widgets/widgets.dart';

List<Workout> workoutList = [
  Workout(id: 1, name: 'Push / Pull', createdAt: DateTime(2025)),
  Workout(
    id: 2,
    name: 'Leg',
    createdAt: DateTime(2025),
    exercises: [
      Exercise(id: 1, name: 'Squat', weightType: WeightType.kg),
      Exercise(id: 2, name: 'Deadlift', weightType: WeightType.kg),
    ],
    details: [
      WorkoutDetail(
        id: 1,
        idWorkout: 2,
        idExercise: 1,
        setType: SetType.warmup,
      ),
      WorkoutDetail(id: 2, idWorkout: 2, idExercise: 1, weight: 10, reps: 10),
      WorkoutDetail(id: 3, idWorkout: 2, idExercise: 1),
    ],
  ),
];

class WorkoutLocalDsImpl extends WorkoutLocalDs {
  @override
  Future<Workout> create(Workout workout) {
    final emptyWorkout = Workout(id: 0, name: '', createdAt: DateTime(2025));

    final maxId = workoutList
        .fold(emptyWorkout, (curr, next) => curr.id > next.id ? curr : next)
        .id;

    final newWorkout = workout.copyWith(id: maxId + 1);
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
    await Future.delayed(Duration(seconds: 2));
    return List<Workout>.of(workoutList);
  }

  @override
  Future<Workout> update(Workout workout) async {
    final index = workoutList.indexWhere((w) => w.id == workout.id);
    workoutList[index] = workout;
    return Future.value(workout);
  }
}

import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/entities/workout_entity.dart';

List<Workout> workoutList = [];

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

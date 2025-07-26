import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/entities/workout_entity.dart';

List<Workout> workoutList = [];

class WorkoutLocalDsImpl extends WorkoutLocalDs {
  @override
  Future<Workout> create(Workout workout) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Workout> delete(Workout workout) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Workout>> getAll() async {
    await Future.delayed(Duration(seconds: 2));
    return List<Workout>.of(workoutList);
  }

  @override
  Future<Workout> update(Workout workout) {
    // TODO: implement update
    throw UnimplementedError();
  }
}

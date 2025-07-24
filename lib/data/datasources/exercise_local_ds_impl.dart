import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';

List<Exercise> exerciseList = [
  Exercise(
    id: 1,
    name: 'Squat',
    weightType: WeightType.kg,
    customCreated: true,
    idUser: 1,
  ),
];

class ExerciseLocalDsImpl extends ExerciseLocalDs {
  @override
  Future<Exercise> create(Exercise exercise) {
    exerciseList.add(exercise);
    return Future.value(exercise);
  }

  @override
  Future<Exercise> delete(Exercise exercise) {
    exerciseList.remove(exercise);
    return Future.value(exercise);
  }

  @override
  Future<List<Exercise>> getAll() async {
    await Future.delayed(Duration(seconds: 2));
    return exerciseList;
  }

  @override
  Future<Exercise> update(Exercise exercise) {
    exerciseList.remove(exercise);
    exerciseList.add(exercise);
    return Future.value(exercise);
  }
}

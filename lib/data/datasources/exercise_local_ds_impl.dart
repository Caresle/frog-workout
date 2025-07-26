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
  Exercise(
    id: 2,
    name: 'Bench Press',
    weightType: WeightType.kg,
    customCreated: true,
    idUser: 1,
  ),
];

class ExerciseLocalDsImpl extends ExerciseLocalDs {
  @override
  Future<Exercise> create(Exercise exercise) async {
    final emptyExercise = Exercise(id: 0, name: '', weightType: WeightType.kg);

    final maxId = exerciseList
        .fold(emptyExercise, (curr, next) => curr.id > next.id ? curr : next)
        .id;
    final newExercise = exercise.copyWith(id: maxId + 1);
    exerciseList.add(newExercise);

    await Future.delayed(Duration(seconds: 2));

    return Future.value(newExercise);
  }

  @override
  Future<Exercise> delete(Exercise exercise) async {
    await Future.delayed(Duration(seconds: 2));
    exerciseList.remove(exercise);
    return Future.value(exercise);
  }

  @override
  Future<List<Exercise>> getAll() async {
    await Future.delayed(Duration(seconds: 2));
    return List<Exercise>.of(exerciseList);
  }

  @override
  Future<Exercise> update(Exercise exercise) {
    exerciseList.removeWhere((e) => e.id == exercise.id);
    exerciseList.add(exercise);
    exerciseList.sort((a, b) => a.id.compareTo(b.id));

    return Future.value(exercise);
  }
}

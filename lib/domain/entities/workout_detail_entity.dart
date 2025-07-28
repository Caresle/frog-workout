import 'package:workouts_app/domain/domain.dart';

class WorkoutDetail {
  final int id;
  final int idWorkout;
  final int idExercise;
  final int? setIndex;
  final int restTime;
  final double weight;
  final double reps;
  final String? notes;

  const WorkoutDetail({
    required this.id,
    required this.idWorkout,
    required this.idExercise,
    this.setIndex,
    this.restTime = 0,
    this.weight = 0,
    this.reps = 0,
    this.notes,
  });

  WorkoutDetail copyWith({
    int? id,
    int? idWorkout,
    int? idExercise,
    int? setIndex,
    int? restTime,
    double? weight,
    double? reps,
    String? notes,
    Exercise? exercise,
  }) {
    return WorkoutDetail(
      id: id ?? this.id,
      idWorkout: idWorkout ?? this.idWorkout,
      idExercise: idExercise ?? this.idExercise,
      setIndex: setIndex ?? this.setIndex,
      restTime: restTime ?? this.restTime,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      notes: notes ?? this.notes,
    );
  }
}

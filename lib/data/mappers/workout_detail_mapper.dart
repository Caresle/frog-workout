import 'package:workouts_app/domain/domain.dart';

class WorkoutDetailMapper {
  static WorkoutDetail fromJson(Map<String, dynamic> json) {
    return WorkoutDetail(
      id: json['id'],
      idWorkout: json['id_workout'],
      idExercise: json['id_exercise'],
      setType: json['set_type'],
      weight: json['weight'],
      reps: json['reps'],
      notes: json['notes'],
    );
  }

  static Map<String, dynamic> toJson(WorkoutDetail detail) {
    return {
      'id': detail.id,
      'id_workout': detail.idWorkout,
      'id_exercise': detail.idExercise,
      'set_type': detail.setType.name,
      'weight': detail.weight,
      'reps': detail.reps,
      'notes': detail.notes,
    };
  }
}

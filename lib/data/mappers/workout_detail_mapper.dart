import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/widgets/widgets.dart';

class WorkoutDetailMapper {
  static WorkoutDetail fromJson(Map<String, dynamic> json) {
    final SetType setType = SetType.values.firstWhere(
      (element) => element.name == json['set_type'],
      orElse: () => SetType.normal,
    );

    final weight = double.tryParse(json['weight'].toString());
    final reps = double.tryParse(json['reps'].toString());
    final restTime = int.tryParse(json['rest_time'].toString());

    return WorkoutDetail(
      id: json['id'].toString(),
      idWorkout: json['id_workout'],
      idExercise: json['id_exercise'],
      setType: setType,
      weight: weight ?? 0,
      reps: reps ?? 0,
      notes: json['notes'],
      restTime: restTime ?? 0,
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
      'rest_time': detail.restTime,
      'notes': detail.notes,
    };
  }
}

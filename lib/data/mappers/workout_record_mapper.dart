import 'package:workouts_app/domain/domain.dart';

class WorkoutRecordMapper {
  static Map<String, dynamic> toJson(WorkoutRecord record) {
    return {
      'id': record.id,
      'workout_name': record.workoutName,
      'start_time': record.startTime.toString(),
      'end_time': record.endTime.toString(),
      'set_type': record.setType,
      'weight': record.weight,
      'reps': record.reps,
      'weight_type': record.weightType,
      'set_index': record.setIndex,
      'rest_time': record.restTime,
      'exercise': record.exercise,
      'exercise_notes': record.exerciseNotes,
      'id_user': record.idUser,
    };
  }

  static WorkoutRecord fromWorkoutDetailUi(WorkoutDetailUi detail) {
    // TODO: implement missing data for workout record
    // startTime, endTime
    return WorkoutRecord(
      id: detail.detail.id,
      workoutName: detail.detail.idWorkout,
      // startTime: detail.detail.startTime,
      startTime: DateTime.now(),
      endTime: DateTime.now(),
      // endTime: detail.detail.endTime,
      setType: detail.detail.setType.name,
      weight: detail.detail.weight,
      reps: detail.detail.reps.toInt(),
      weightType: '',
      setIndex: 0,
      restTime: detail.detail.restTime,
      exercise: '',
      exerciseNotes: '',
      idUser: '',
    );
  }

  static WorkoutRecord fromJson(Map<String, dynamic> json) {
    return WorkoutRecord(
      id: json['id'],
      workoutName: json['workout_name'],
      startTime: DateTime.parse(json['start_time']),
      endTime: DateTime.parse(json['end_time']),
      setType: json['set_type'],
      weight: json['weight'],
      reps: json['reps'],
      weightType: json['weight_type'],
      setIndex: json['set_index'],
      restTime: json['rest_time'],
      exercise: json['exercise'],
      exerciseNotes: json['exercise_notes'],
      idUser: json['id_user'],
    );
  }
}

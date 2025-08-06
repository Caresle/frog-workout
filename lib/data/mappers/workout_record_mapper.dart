import 'package:workouts_app/domain/domain.dart';

class WorkoutRecordMapper {
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
}

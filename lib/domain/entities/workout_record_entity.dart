class WorkoutRecord {
  final String id;
  final String workoutName;
  final DateTime startTime;
  final DateTime endTime;
  final String setType;
  final double weight;
  final int reps;
  final String weightType;
  final int setIndex;
  final int restTime;
  final String exercise;
  final String exerciseNotes;
  final String idUser;
  final int syncStatus;

  const WorkoutRecord({
    required this.id,
    required this.workoutName,
    required this.startTime,
    required this.endTime,
    required this.setType,
    required this.weight,
    required this.reps,
    required this.weightType,
    required this.setIndex,
    required this.restTime,
    required this.exercise,
    required this.exerciseNotes,
    required this.idUser,
    this.syncStatus = 0,
  });

  WorkoutRecord copyWith({
    String? id,
    String? workoutName,
    DateTime? startTime,
    DateTime? endTime,
    String? setType,
    double? weight,
    int? reps,
    String? weightType,
    int? setIndex,
    int? restTime,
    String? exercise,
    String? exerciseNotes,
    String? idUser,
    int? syncStatus,
  }) {
    return WorkoutRecord(
      id: id ?? this.id,
      workoutName: workoutName ?? this.workoutName,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      setType: setType ?? this.setType,
      weight: weight ?? this.weight,
      reps: reps ?? this.reps,
      weightType: weightType ?? this.weightType,
      setIndex: setIndex ?? this.setIndex,
      restTime: restTime ?? this.restTime,
      exercise: exercise ?? this.exercise,
      exerciseNotes: exerciseNotes ?? this.exerciseNotes,
      idUser: idUser ?? this.idUser,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }
}

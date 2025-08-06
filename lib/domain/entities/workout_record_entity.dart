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
  });
}

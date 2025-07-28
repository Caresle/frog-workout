import 'package:workouts_app/domain/domain.dart';

class Workout {
  final int id;
  final int? idUser;
  final String name;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<Exercise> exercises;
  final List<WorkoutDetail> details;

  const Workout({
    required this.id,
    required this.name,
    required this.createdAt,
    this.idUser,
    this.updatedAt,
    this.exercises = const <Exercise>[],
    this.details = const <WorkoutDetail>[],
  });

  Workout copyWith({
    int? id,
    int? idUser,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Exercise>? exercises,
    List<WorkoutDetail>? details,
  }) {
    return Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      idUser: idUser ?? this.idUser,
      updatedAt: updatedAt ?? this.updatedAt,
      exercises: exercises ?? this.exercises,
      details: details ?? this.details,
    );
  }
}

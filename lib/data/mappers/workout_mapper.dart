import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';
import 'dart:convert' as convert;

class WorkoutMapper {
  static Workout fromJson(Map<String, dynamic> json) {
    final exercisesString = json['exercises'];
    List<Exercise> exercises = [];

    final detailsString = json['details'];
    List<WorkoutDetail> details = [];

    try {
      final decoded = convert.json.decode(exercisesString);
      if (decoded is List) {
        exercises = List<Exercise>.from(
          decoded.map((e) => ExerciseMapper.fromJson(e)),
        );
      }
    } catch (e) {
      print('Error decoding exercises: $e');
    }

    try {
      final decoded = convert.json.decode(detailsString);
      if (decoded is List) {
        details = List<WorkoutDetail>.from(
          decoded.map((d) => WorkoutDetailMapper.fromJson(d)),
        );
      }
    } catch (e) {
      print('Error decoding details: $e');
    }

    return Workout(
      id: json['id'],
      name: json['name'] ?? "",
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      exercises: exercises,
      details: details,
    );
  }

  static Map<String, dynamic> toJson(Workout workout) {
    return {
      'id': workout.id,
      'name': workout.name,
      'created_at': workout.createdAt.toString(),
    };
  }
}

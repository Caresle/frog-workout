import 'package:workouts_app/domain/domain.dart';

class ExerciseMapper {
  static Exercise fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'],
      weightType: json['weight_type'] == 'kg' ? WeightType.kg : WeightType.lbs,
      customCreated: json['custom_created'] == 1,
      idUser: json['id_user'],
    );
  }

  static Map<String, dynamic> toJson(Exercise exercise) {
    return {
      'id': exercise.id,
      'name': exercise.name,
      'weight_type': exercise.weightType == WeightType.kg ? 'kg' : 'lbs',
      'custom_created': exercise.customCreated ? 1 : 0,
      'id_user': exercise.idUser,
    };
  }
}

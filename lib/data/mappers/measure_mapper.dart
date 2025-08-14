import 'package:workouts_app/domain/domain.dart';

class MeasureMapper {
  static Map<String, dynamic> toJson(Measures measures) {
    return {
      'id': measures.id,
      'name': measures.name,
      'description': measures.description,
      'value': measures.value,
      'created_at': measures.date.toString(),
    };
  }

  static Measures fromJson(Map<String, dynamic> json) {
    return Measures(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      value: json['value'],
      date: DateTime.parse(json['created_at']),
    );
  }
}

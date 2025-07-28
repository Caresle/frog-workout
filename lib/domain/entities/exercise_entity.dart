enum WeightType { kg, lbs }

class Exercise {
  final int id;
  final String name;
  final WeightType weightType;
  final bool customCreated;
  final int? idUser;

  const Exercise({
    required this.id,
    required this.name,
    required this.weightType,
    this.customCreated = true,
    this.idUser,
  });

  factory Exercise.empty() {
    return Exercise(
      id: 0,
      name: '',
      weightType: WeightType.kg,
      customCreated: true,
      idUser: 0,
    );
  }

  Exercise copyWith({
    int? id,
    String? name,
    WeightType? weightType,
    bool? customCreated,
    int? idUser,
  }) {
    return Exercise(
      id: id ?? this.id,
      name: name ?? this.name,
      weightType: weightType ?? this.weightType,
      customCreated: customCreated ?? this.customCreated,
      idUser: idUser ?? this.idUser,
    );
  }
}

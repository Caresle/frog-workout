class Workout {
  final int id;
  final int? idUser;
  final String name;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Workout({
    required this.id,
    required this.name,
    required this.createdAt,
    this.idUser,
    this.updatedAt,
  });

  Workout copyWith({
    int? id,
    int? idUser,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Workout(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      idUser: idUser ?? this.idUser,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

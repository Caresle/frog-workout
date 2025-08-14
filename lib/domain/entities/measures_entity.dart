class Measures {
  final int id;
  final String name;
  final String description;
  final double value;
  final DateTime date;

  const Measures({
    required this.id,
    required this.name,
    required this.description,
    required this.value,
    required this.date,
  });

  Measures copyWith({
    int? id,
    String? name,
    String? description,
    double? value,
    DateTime? date,
  }) {
    return Measures(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      value: value ?? this.value,
      date: date ?? this.date,
    );
  }
}

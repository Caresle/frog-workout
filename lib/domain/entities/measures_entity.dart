class Measures {
  final int id;
  final String name;
  final String description;
  final double value;

  const Measures({
    required this.id,
    required this.name,
    required this.description,
    required this.value,
  });

  Measures copyWith({
    int? id,
    String? name,
    String? description,
    double? value,
  }) {
    return Measures(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      value: value ?? this.value,
    );
  }
}

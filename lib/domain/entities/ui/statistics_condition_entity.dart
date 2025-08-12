class StatisticsCondition {
  final String name;
  final bool isSelected;

  const StatisticsCondition({required this.name, required this.isSelected});

  StatisticsCondition copyWith({String? name, bool? isSelected}) {
    return StatisticsCondition(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

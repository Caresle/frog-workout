enum StatisticsConditionType { reps, weight, restTime }

class StatisticsCondition {
  final String name;
  final bool isSelected;
  final StatisticsConditionType type;

  const StatisticsCondition({
    required this.name,
    required this.isSelected,
    this.type = StatisticsConditionType.reps,
  });

  StatisticsCondition copyWith({
    String? name,
    bool? isSelected,
    StatisticsConditionType? type,
  }) {
    return StatisticsCondition(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      type: type ?? this.type,
    );
  }
}

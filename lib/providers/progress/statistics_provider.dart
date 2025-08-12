import 'package:flutter/foundation.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';

class StatisticsProvider extends ChangeNotifier {
  Exercise? selectedExercise;
  List<WorkoutRecord> recordsByExercise = [];
  bool isLoading = false;
  List<StatisticsCondition> conditions = [
    StatisticsCondition(name: 'Reps', isSelected: true),
    StatisticsCondition(name: 'Weight', isSelected: false),
    StatisticsCondition(name: 'Rest time', isSelected: false),
  ];

  Future<void> updateExercise(
    Exercise? exercise,
    RecordProvider recordProvider,
  ) async {
    isLoading = true;
    selectedExercise = exercise;

    if (exercise == null) {
      isLoading = false;
      notifyListeners();
      return;
    }

    recordsByExercise = await recordProvider.getRecordsByExercise(exercise);
    isLoading = false;
    notifyListeners();
  }

  List<bool> get selectedConditions {
    return conditions.map((c) => c.isSelected).toList();
  }

  void toggleConditionByIndex(int index) {
    if (conditions[index].isSelected) return;

    conditions = conditions.asMap().entries.map((entry) {
      final ind = entry.key;
      final condition = entry.value;

      if (ind == index) {
        return condition.copyWith(isSelected: !condition.isSelected);
      }

      return condition.copyWith(isSelected: false);
    }).toList();
    notifyListeners();
  }
}

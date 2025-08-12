import 'package:flutter/foundation.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';

class StatisticsProvider extends ChangeNotifier {
  Exercise? selectedExercise;
  List<WorkoutRecord> recordsByExercise = [];
  bool isLoading = false;

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
}

import 'package:workouts_app/domain/domain.dart';

class WorkoutDetailUi {
  final WorkoutDetail detail;
  final bool isComplete;

  const WorkoutDetailUi({required this.detail, this.isComplete = false});

  factory WorkoutDetailUi.fromWorkoutDetail(WorkoutDetail detail) {
    return WorkoutDetailUi(detail: detail);
  }

  WorkoutDetailUi copyWith({WorkoutDetail? detail, bool? isComplete}) {
    return WorkoutDetailUi(
      detail: detail ?? this.detail,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}

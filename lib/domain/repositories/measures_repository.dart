import 'package:workouts_app/domain/domain.dart';

abstract class MeasuresRepository {
  Future<List<Measures>> getMeasures();
  Future<void> addMeasure(Measures measures);
  Future<void> updateMeasure(Measures measures);
  Future<void> deleteMeasure(Measures measures);
}

import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';

class MeasuresRepositoryImpl extends MeasuresRepository {
  final MeasuresLocalDs _measuresLocalDs;

  MeasuresRepositoryImpl(this._measuresLocalDs);

  @override
  Future<void> addMeasure(Measures measures) {
    return _measuresLocalDs.create(measures);
  }

  @override
  Future<void> deleteMeasure(Measures measures) {
    return _measuresLocalDs.delete(measures);
  }

  @override
  Future<List<Measures>> getMeasures() {
    return _measuresLocalDs.getAll();
  }

  @override
  Future<void> updateMeasure(Measures measures) {
    return _measuresLocalDs.update(measures);
  }
}

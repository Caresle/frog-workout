import 'package:workouts_app/domain/domain.dart';

abstract class MeasuresLocalDs {
  Future<Measures> create(Measures measures);
  Future<Measures> delete(Measures measures);
  Future<List<Measures>> getAll();
  Future<Measures> update(Measures measures);
}

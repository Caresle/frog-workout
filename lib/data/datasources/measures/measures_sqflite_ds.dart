import 'package:workouts_app/config/config.dart';
import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/domain/domain.dart';

class MeasuresSqfliteDs extends MeasuresLocalDs {
  final String tableName = "tbl_wk_measures";

  @override
  Future<Measures> create(Measures measures) async {
    final db = await DbHandler().getInstance();

    final value = MeasureMapper.toJson(measures);

    value.remove('id');
    final result = await db.insert(tableName, value);

    return measures.copyWith(id: result);
  }

  @override
  Future<Measures> delete(Measures measures) async {
    final db = await DbHandler().getInstance();

    await db.delete(tableName, where: 'id = ?', whereArgs: [measures.id]);

    return measures;
  }

  @override
  Future<List<Measures>> getAll() async {
    final db = await DbHandler().getInstance();

    final result = await db.query(tableName);
    final measures = result.map((row) => MeasureMapper.fromJson(row)).toList();

    return measures;
  }

  @override
  Future<Measures> update(Measures measures) async {
    final db = await DbHandler().getInstance();

    final value = MeasureMapper.toJson(measures);

    await db.update(
      tableName,
      value,
      where: 'id = ?',
      whereArgs: [measures.id],
    );

    return measures;
  }
}

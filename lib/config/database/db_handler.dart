import 'package:sqflite/sqflite.dart';
import 'package:workouts_app/config/database/migrations/migrations.dart';
import 'package:workouts_app/constants/app_constants.dart';

class DbHandler {
  Database? _db;

  Future<bool> init() async {
    _db = await getInstance();
    return _db != null;
  }

  Future<Database> getInstance() async {
    if (_db != null) return _db!;

    _db = await openDatabase(
      AppConstants.dbLocalName,
      version: 1,

      onCreate: (db, version) async {
        for (var query in migrations) {
          await db.execute(query);
        }
      },
    );

    if (_db == null) {
      throw Exception('Failed to open database');
    }

    return _db!;
  }
}

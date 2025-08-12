import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:workouts_app/domain/domain.dart';

Future<void> exportData(List<WorkoutRecord> records) async {
  String csv = '';

  for (var record in records) {
    csv += '${record.toCsv()}\n';
  }

  final directory = await getApplicationDocumentsDirectory();
  final filePath = '${directory.path}/frog_workouts.csv';
  final file = File(filePath);

  await file.writeAsString(csv);

  print('Exported data to $filePath');
}

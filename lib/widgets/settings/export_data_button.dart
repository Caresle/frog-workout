import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/config/config.dart';
import 'package:workouts_app/providers/providers.dart';

class ExportDataButton extends StatelessWidget {
  const ExportDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width - 16,
      child: FilledButton.tonalIcon(
        onPressed: () async {
          final recordsProvider = context.read<RecordProvider>();
          await recordsProvider.getRecords();

          await exportData(recordsProvider.records);
        },
        icon: Icon(Icons.ios_share_rounded),
        label: Text('Export data'),
      ),
    );
  }
}

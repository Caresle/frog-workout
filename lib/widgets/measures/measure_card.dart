import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';

class MeasureCard extends StatelessWidget {
  const MeasureCard({super.key, required this.measure});

  final Measures measure;

  @override
  Widget build(BuildContext context) {
    final measureProvider = context.read<MeasuresProvider>();

    return Card(
      child: ListTile(
        title: Row(
          children: [
            Text(measure.name),
            const SizedBox(width: 8),
            Text(measure.value.toStringAsFixed(2)),
            const Spacer(),
            IconButton(
              onPressed: () async {
                await measureProvider.deleteMeasure(measure);
              },
              icon: Icon(Icons.delete_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

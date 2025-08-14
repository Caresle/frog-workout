import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class MeasuresList extends StatelessWidget {
  const MeasuresList({super.key});

  @override
  Widget build(BuildContext context) {
    final measures = context.watch<MeasuresProvider>().measures;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: measures.length,
      itemBuilder: (context, index) {
        final measure = measures[index];
        return MeasureCard(measure: measure);
      },
    );
  }
}

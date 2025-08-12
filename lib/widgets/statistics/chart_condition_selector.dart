import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';

class ChartConditionSelector extends StatelessWidget {
  const ChartConditionSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final statisticProvider = context.watch<StatisticsProvider>();

    return ToggleButtons(
      isSelected: statisticProvider.selectedConditions,
      borderColor: Colors.transparent,
      selectedBorderColor: Colors.transparent,
      fillColor: Colors.transparent,
      renderBorder: false,
      onPressed: (index) {
        statisticProvider.toggleConditionByIndex(index);
      },
      children: [
        ...statisticProvider.conditions.map((condition) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Chip(
              shape: StadiumBorder(
                side: BorderSide(
                  color: condition.isSelected ? Colors.blue : Colors.blueGrey,
                ),
              ),
              color: condition.isSelected
                  ? WidgetStatePropertyAll(Colors.blue)
                  : null,
              label: Text(
                condition.name,
                style: TextStyle(
                  color: condition.isSelected ? Colors.white : Colors.blue,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}

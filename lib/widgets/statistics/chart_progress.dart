import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';

class ChartDataDisplay {
  final List<FlSpot> spots;
  final double maxY;

  const ChartDataDisplay({required this.spots, required this.maxY});
}

class ChartProgress extends StatelessWidget {
  const ChartProgress({super.key});

  FlGridData getGridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      drawHorizontalLine: true,
      horizontalInterval: 1,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) =>
          FlLine(color: Colors.blueGrey.withAlpha(120), strokeWidth: 1),
      getDrawingVerticalLine: (value) =>
          FlLine(color: Colors.blueGrey.withAlpha(120), strokeWidth: 1),
    );
  }

  ChartDataDisplay getChartData({
    required List<WorkoutRecord> records,
    StatisticsConditionType type = StatisticsConditionType.reps,
  }) {
    final maxY = records.fold(0.0, (top, record) {
      switch (type) {
        case StatisticsConditionType.reps:
          return max(top, record.reps.toDouble());
        case StatisticsConditionType.weight:
          return max(top, record.weight);
        case StatisticsConditionType.restTime:
          return max(top, record.restTime.toDouble());
      }
    });

    final spots = records.asMap().entries.map((entry) {
      final index = entry.key.toDouble();
      final record = entry.value;

      switch (type) {
        case StatisticsConditionType.reps:
          return FlSpot(index, record.reps.toDouble());
        case StatisticsConditionType.weight:
          return FlSpot(index, record.weight);
        case StatisticsConditionType.restTime:
          return FlSpot(index, record.restTime.toDouble());
      }
    }).toList();

    return ChartDataDisplay(spots: spots, maxY: maxY);
  }

  LineChartData getData({
    required List<WorkoutRecord> records,
    StatisticsConditionType type = StatisticsConditionType.reps,
  }) {
    final chartData = getChartData(records: records, type: type);

    return LineChartData(
      gridData: getGridData(),
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      maxY: chartData.maxY,
      lineBarsData: [
        LineChartBarData(
          spots: chartData.spots,
          color: Colors.blue.shade600,
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade900.withAlpha(60),
                Colors.blue.shade700.withAlpha(60),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StatisticsProvider>();
    final records = provider.recordsByExercise;
    final condition = provider.conditions.firstWhere((c) => c.isSelected);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width - 16,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: LineChart(getData(records: records, type: condition.type)),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProgressGeneralChart extends StatelessWidget {
  const ProgressGeneralChart({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width - 16,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1.70,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: true,
                        drawHorizontalLine: true,
                        horizontalInterval: 1,
                        verticalInterval: 1,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: Colors.blueGrey.withAlpha(120),
                          strokeWidth: 1,
                        ),
                        getDrawingVerticalLine: (value) => FlLine(
                          color: Colors.blueGrey.withAlpha(120),
                          strokeWidth: 1,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      maxY: 5,
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 1),
                            FlSpot(1, 1.5),
                            FlSpot(2, 2),
                            FlSpot(3, 3),
                            FlSpot(4, 4),
                            FlSpot(5, 4),
                            FlSpot(6, 3),
                          ],
                          color: Colors.blue.shade600,
                          isCurved: true,
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

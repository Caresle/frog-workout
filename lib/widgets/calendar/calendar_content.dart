import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class CalendarContent extends StatelessWidget {
  const CalendarContent({super.key});

  TableRow getHeaderTable() {
    return TableRow(
      children: [
        Text('Mon', textAlign: TextAlign.center),
        Text('Tue', textAlign: TextAlign.center),
        Text('Wed', textAlign: TextAlign.center),
        Text('Thu', textAlign: TextAlign.center),
        Text('Fri', textAlign: TextAlign.center),
        Text('Sat', textAlign: TextAlign.center),
        Text('Sun', textAlign: TextAlign.center),
      ],
    );
  }

  List<TableRow> getDayTable(DateTime now) {
    final firstDay = DateTime(now.year, now.month, 1);
    final lastDay = DateTime(now.year, now.month + 1, 0);

    /// Weekday is from 1 to 7 and starts with Monday
    final leadingDays = firstDay.weekday - 1;
    final trailingDays = 7 - lastDay.weekday;

    final totalDays = lastDay.day;
    final totalCells = leadingDays + totalDays + trailingDays;
    final totalWeeks = totalCells ~/ 7;

    List<CalendarDay> days = [];
    List<TableRow> weeks = [];

    var day = firstDay;
    final month = firstDay.month;

    for (var i = 0; i < totalCells; i++) {
      if (i < leadingDays) {
        days.add(CalendarDay());
        continue;
      }

      if (day.month != month) {
        days.add(CalendarDay());
        continue;
      }

      days.add(CalendarDay(day: '${day.day}', isMarked: i % 2 == 0));
      day = day.add(Duration(days: 1));
    }

    for (var i = 0; i < totalWeeks; i++) {
      weeks.add(TableRow(children: days.sublist(i * 7, i * 7 + 7)));
    }

    return weeks;
  }

  @override
  Widget build(BuildContext context) {
    final now = context.watch<CalendarProvider>().date;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        children: [
          getHeaderTable(),
          // Weeks
          ...getDayTable(now),
        ],
      ),
    );
  }
}

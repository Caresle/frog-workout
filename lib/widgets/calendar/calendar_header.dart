import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';

List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

class CalendarHeader extends StatelessWidget {
  const CalendarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final date = context.watch<CalendarProvider>().date;
    final month = months[date.month - 1];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              final newDate = DateTime(date.year, date.month - 1);

              context.read<CalendarProvider>().updateDate(newDate);
            },
            icon: Icon(Icons.arrow_back_ios_rounded),
          ),
          Text(month.toString()),
          IconButton(
            onPressed: () {
              final newDate = DateTime(date.year, date.month + 1);

              context.read<CalendarProvider>().updateDate(newDate);
            },
            icon: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}

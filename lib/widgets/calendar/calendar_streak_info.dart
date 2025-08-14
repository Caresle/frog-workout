import 'package:flutter/material.dart';

class CalendarStreakInfo extends StatelessWidget {
  const CalendarStreakInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [Text('Total Weeks'), Text('10')]),
          ),
        ),
        Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(children: [Text('Rest Days'), Text('10')]),
          ),
        ),
      ],
    );
  }
}

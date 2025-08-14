import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calendar')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              CalendarStreakInfo(),
              CalendarHeader(),
              CalendarContent(),
            ],
          ),
        ),
      ),
    );
  }
}

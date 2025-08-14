import 'package:flutter/material.dart';

class CalendarDay extends StatelessWidget {
  final bool isMarked;
  final String day;

  const CalendarDay({super.key, this.isMarked = false, this.day = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isMarked ? Colors.blue : Colors.transparent,
      ),
      child: Text(
        day,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

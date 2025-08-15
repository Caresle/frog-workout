import 'package:flutter/material.dart';

class CalendarProvider extends ChangeNotifier {
  DateTime date = DateTime.now();

  CalendarProvider();

  void updateDate(DateTime date) {
    this.date = date;
    notifyListeners();
  }
}

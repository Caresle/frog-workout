import 'package:flutter/widgets.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = true;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

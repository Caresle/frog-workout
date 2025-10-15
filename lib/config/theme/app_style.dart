import 'package:flutter/material.dart';

// final Color primary = Color(0xFFFFFFFF);
// final Color secondary = Color(0xFFB6B6B6);
// final Color third = Color(0xFF676767);
// final Color background = Color(0xFF0D0D0D);

final Color primary = Color(0xFF3A8DFF);
final Color surface = Color(0xFF1E1E1E);
final Color text = Color(0xFFF2F2F2);
final Color background = Color(0xFF0D0D0D);

class AppStyle {
  static final ButtonStyle filledDangerGhost = FilledButton.styleFrom(
    backgroundColor: Colors.red.shade200.withAlpha(40),
    foregroundColor: Colors.red.shade400,
  );

  static final ButtonStyle filledSecondaryGhost = FilledButton.styleFrom(
    backgroundColor: Colors.blueGrey.shade200.withAlpha(40),
    foregroundColor: Colors.blueGrey.shade400,
  );

  static final ButtonStyle filledDangerHighGhost = FilledButton.styleFrom(
    backgroundColor: Colors.red.shade900.withAlpha(30),
    foregroundColor: Colors.red.shade500,
  );

  static final ButtonStyle filledDanger = FilledButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.red.shade500,
  );

  static final ButtonStyle elevatedButtonSecondary = ElevatedButton.styleFrom(
    backgroundColor: Colors.blueGrey.shade900.withAlpha(20),
  );

  static final ButtonStyle filledPrimaryBorderSm = FilledButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );

  static final ButtonStyle textButtonDisabled = TextButton.styleFrom(
    backgroundColor: Colors.grey.shade800.withAlpha(150),
    foregroundColor: Colors.grey.shade700,
    disabledBackgroundColor: Colors.grey.shade800.withAlpha(150),
    disabledForegroundColor: Colors.grey.shade700,
  );

  static ThemeData themeData(bool isDark) => ThemeData(
    brightness: isDark ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: background,
    appBarTheme: AppBarTheme(
      backgroundColor: background,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: background,
      // unselectedItemColor: third,
      // unselectedIconTheme: IconThemeData(color: third),
      selectedIconTheme: IconThemeData(color: primary),
      selectedItemColor: primary,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: text,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    cardTheme: CardThemeData(
      color: surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    useMaterial3: true,
  );
}

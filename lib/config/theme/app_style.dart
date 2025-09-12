import 'package:flutter/material.dart';

final Color primary = Color(0xFFFFFFFF);
final Color secondary = Color(0xFFB6B6B6);
final Color third = Color(0xFF676767);
final Color background = Color(0xFF000000);

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
    // colorScheme: ColorScheme(
    //   brightness: isDark ? Brightness.dark : Brightness.light,
    //   primary: primary,
    //   secondary: Colors.amber.shade700,
    //   surface: Colors.grey.shade800,
    //   error: Colors.redAccent,
    //   onPrimary: Colors.black,
    //   onSecondary: Colors.black,
    //   onSurface: Colors.white,
    //   onError: Colors.white,
    // ),
    scaffoldBackgroundColor: background,
    // textTheme: TextTheme(
    //   headlineLarge: TextStyle(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 32,
    //     color: Colors.tealAccent.shade700,
    //   ),
    //   headlineMedium: TextStyle(
    //     fontWeight: FontWeight.w600,
    //     fontSize: 24,
    //     color: Colors.white,
    //   ),
    //   bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
    //   bodyMedium: TextStyle(fontSize: 16, color: Colors.white60),
    //   labelLarge: TextStyle(
    //     fontWeight: FontWeight.w500,
    //     fontSize: 14,
    //     color: Colors.amber.shade700,
    //   ),
    // ),
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
      unselectedItemColor: third,
      unselectedIconTheme: IconThemeData(color: third),
      selectedIconTheme: IconThemeData(color: primary),
      selectedItemColor: primary,
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: Colors.tealAccent.shade700,
    //     foregroundColor: Colors.black,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //     padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    //     textStyle: TextStyle(fontWeight: FontWeight.bold),
    //   ),
    // ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: primary,
    //     foregroundColor: background,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   ),
    // ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    cardTheme: CardThemeData(
      color: background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: third),
      ),
    ),
    // inputDecorationTheme: InputDecorationTheme(
    //   filled: true,
    //   fillColor: Colors.grey.shade800,
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: BorderSide.none,
    //   ),
    //   hintStyle: TextStyle(color: Colors.white38),
    //   labelStyle: TextStyle(color: Colors.tealAccent.shade700),
    // ),
    useMaterial3: true,
  );
}

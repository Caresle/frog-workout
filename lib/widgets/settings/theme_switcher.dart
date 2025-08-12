import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDark;

    return Row(
      children: [
        Icon(Icons.brightness_6_rounded),
        const SizedBox(width: 8),
        Text('Dark mode'),
        const Spacer(),
        Switch(
          value: isDark,
          onChanged: (value) {
            final themeProvider = context.read<ThemeProvider>();
            themeProvider.toggleTheme();
          },
        ),
      ],
    );
  }
}

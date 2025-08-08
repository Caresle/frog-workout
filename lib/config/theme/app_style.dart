import 'package:flutter/material.dart';

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
}

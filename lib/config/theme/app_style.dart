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
}

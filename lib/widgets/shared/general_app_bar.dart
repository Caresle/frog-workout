import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

AppBar generalAppBar() {
  return AppBar(title: const Text('Frog Workouts'));
}

AppBar generalAppBarWithSettings(BuildContext context) {
  return AppBar(
    title: const Text('Frog Workouts'),
    actions: [
      IconButton(
        onPressed: () {
          context.push('/settings');
        },
        icon: const Icon(Icons.settings_rounded),
      ),
    ],
  );
}

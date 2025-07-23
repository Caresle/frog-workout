import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewExerciseButton extends StatelessWidget {
  const NewExerciseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () {
        context.push('/exercises/-1');
      },
      child: Row(
        children: const [Icon(Icons.add_rounded), Text('New exercise')],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/config/theme/theme.dart';
import 'package:workouts_app/providers/providers.dart';

class FinishWorkoutSession extends StatelessWidget {
  const FinishWorkoutSession({super.key});

  @override
  Widget build(BuildContext context) {
    final workoutSession = context.read<WorkoutSessionProvider>();

    return FilledButton(
      onPressed: () async {
        final isValid = workoutSession.validateSession();

        if (!isValid) {
          await _invalidDataAlert(context);
          return;
        }

        await workoutSession.finishWorkout();

        if (context.mounted) {
          context.go('/');
        }
      },
      child: Text('Finish'),
    );
  }

  Future<dynamic> _invalidDataAlert(BuildContext context) {
    final workoutSession = context.read<WorkoutSessionProvider>();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Invalid session'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('There are some invalid sets, what do you want to do?'),
              const SizedBox(height: 8),
              ElevatedButton(
                style: AppStyle.elevatedButtonSecondary,
                onPressed: () async {
                  await workoutSession.finishWorkout(saveInvalidSets: true);

                  if (context.mounted) {
                    context.go('/');
                  }
                },
                child: Text('Discard invalid sets'),
              ),
              FilledButton(
                style: AppStyle.filledDangerGhost,
                onPressed: () async {
                  await workoutSession.finishWorkout(saveInvalidSets: false);

                  if (context.mounted) {
                    context.go('/');
                  }
                },
                child: Text('Save invalid sets'),
              ),
            ],
          ),
        );
      },
    );
  }
}

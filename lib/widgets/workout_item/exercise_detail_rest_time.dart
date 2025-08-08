import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/config/config.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';

class ExerciseDetailRestTime extends StatefulWidget {
  final Workout workout;
  final Exercise exercise;

  const ExerciseDetailRestTime({
    super.key,
    required this.workout,
    required this.exercise,
  });

  @override
  State<ExerciseDetailRestTime> createState() => _ExerciseDetailRestTimeState();
}

class _ExerciseDetailRestTimeState extends State<ExerciseDetailRestTime> {
  Duration _duration = Duration(minutes: 0);

  String getTimeFormat(int timeInSeconds) {
    final duration = Duration(seconds: timeInSeconds);
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final workoutProvider = context.read<WorkoutsProvider>();
    final details = widget.workout.details
        .where((detail) => detail.idExercise == widget.exercise.id)
        .toList();

    if (details.isEmpty) {
      return Text(
        'Add at least one set to update the timer for the exercise',
        style: TextStyle(
          color: Colors.amber.shade600.withAlpha(180),
          fontWeight: FontWeight.w500,
        ),
      );
    }

    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: deviceSize.width,
                height: deviceSize.height * 0.4,
                child: Column(
                  children: [
                    const Text('Rest time', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    CupertinoTimerPicker(
                      initialTimerDuration: _duration,
                      onTimerDurationChanged: (duration) {
                        _duration = duration;
                        setState(() {});
                      },
                      mode: CupertinoTimerPickerMode.ms,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () async {
                        await workoutProvider.udpateRestTime(
                          _duration.inSeconds,
                          details,
                        );

                        _duration = Duration.zero;
                        if (!context.mounted) return;
                        context.pop();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.check_rounded),
                          const SizedBox(width: 8),
                          Text('Save'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Row(
        children: [
          Icon(Icons.timer_rounded, color: Colors.blue),
          const SizedBox(width: 4),
          Text(
            getTimeFormat(details.firstOrNull?.restTime ?? 0),
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

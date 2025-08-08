import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseDetailRestTime extends StatelessWidget {
  const ExerciseDetailRestTime({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

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
                      onTimerDurationChanged: (_) {},
                      mode: CupertinoTimerPickerMode.ms,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () {
                        print('hey');
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
            '10 min',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

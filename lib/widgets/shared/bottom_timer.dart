import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workouts_app/config/theme/theme.dart';

class BottomTimer extends StatefulWidget {
  /// Duration in seconds
  final int duration;
  final void Function()? onStop;

  const BottomTimer({super.key, this.duration = 15, this.onStop});

  @override
  State<BottomTimer> createState() => BottomTimerState();
}

class BottomTimerState extends State<BottomTimer> {
  int _duration = 0;
  int _currentDuration = 0;
  Timer? _timer;
  bool show = false;

  void startTimer(int duration) {
    _duration = duration;
    _currentDuration = 0;
    show = true;
    setState(() {});
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      _currentDuration++;
      if (_duration - _currentDuration <= 0) {
        _stopTimer();
      }
      setState(() {});
    });
  }

  String getTimeFormat() {
    final currentSeconds = Duration(seconds: _duration - _currentDuration);
    final minutes = currentSeconds.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    final seconds = currentSeconds.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');

    return '$minutes:$seconds';
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    show = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!show) return Container();
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.timer_rounded),
                const SizedBox(width: 8),
                Text(
                  getTimeFormat(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            FilledButton(
              style: AppStyle.filledPrimaryBorderSm,
              onPressed: () {
                _stopTimer();
              },
              child: Text('Skip'),
            ),
          ],
        ),
      ),
    );
  }
}

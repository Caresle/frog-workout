import 'package:flutter/material.dart';

class ExerciseFormScreen extends StatelessWidget {
  final int id;

  const ExerciseFormScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: id == -1
            ? const Text('New exercise')
            : const Text('Edit exercise'),
      ),
      body: SafeArea(child: Text("Exercise form screen")),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(),
      body: SafeArea(child: Text("Exercise screen")),
      bottomNavigationBar: MainNavigationBar(selectedIndex: 1),
    );
  }
}

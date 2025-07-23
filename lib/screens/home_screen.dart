import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const Text("Home screen"),
            FilledButton(onPressed: () {}, child: Text('Start')),
          ],
        ),
      ),
      bottomNavigationBar: MainNavigationBar(selectedIndex: 0),
    );
  }
}

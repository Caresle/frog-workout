import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) return;

    _isInit = true;
    Future.microtask(() {
      if (!mounted) return;

      final provider = Provider.of<ExerciseProvider>(context, listen: false);
      provider.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generalAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewExerciseButton(),
              const SizedBox(height: 16),
              const Text(
                'List of exercises',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              ExerciseList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainNavigationBar(selectedIndex: 1),
    );
  }
}

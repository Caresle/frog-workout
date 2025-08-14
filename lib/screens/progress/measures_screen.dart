import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class MeasuresScreen extends StatefulWidget {
  const MeasuresScreen({super.key});

  @override
  State<MeasuresScreen> createState() => _MeasuresScreenState();
}

class _MeasuresScreenState extends State<MeasuresScreen> {
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) return;

    _isInit = true;
    Future.microtask(() {
      if (!mounted) return;

      final provider = Provider.of<MeasuresProvider>(context, listen: false);
      provider.getMeasures();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measures'),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/progress/measures/form');
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text('Overview (placeholder chart)'),
              const SizedBox(height: 8),
              ProgressGeneralChart(),
              MeasuresList(),
            ],
          ),
        ),
      ),
    );
  }
}

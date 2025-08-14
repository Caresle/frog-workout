import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';

class MeasureFormScreen extends StatefulWidget {
  const MeasureFormScreen({super.key});

  @override
  State<MeasureFormScreen> createState() => _MeasureFormScreenState();
}

class _MeasureFormScreenState extends State<MeasureFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Add measure')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _valueController,
                decoration: const InputDecoration(
                  labelText: 'Value',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: size.width - 16,
                child: FilledButton(
                  onPressed: () async {
                    final measuresProvider = context.read<MeasuresProvider>();

                    final measure = Measures(
                      id: -1,
                      name: _nameController.text,
                      description: '',
                      value: double.parse(_valueController.text),
                      date: DateTime.now(),
                    );

                    await measuresProvider.addMeasure(measure);

                    if (!context.mounted) return;
                    context.pop();
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

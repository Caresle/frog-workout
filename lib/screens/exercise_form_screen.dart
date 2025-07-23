import 'package:flutter/material.dart';

class ExerciseFormScreen extends StatelessWidget {
  final int id;

  const ExerciseFormScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: id == -1
            ? const Text('New exercise')
            : const Text('Edit exercise'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownMenu(
                label: const Text('Unit'),
                width: deviceSize.width - 16,
                dropdownMenuEntries: [
                  DropdownMenuEntry(label: 'KG', value: 'kg'),
                  DropdownMenuEntry(label: 'LB', value: 'lb'),
                ],
              ),
              FilledButton.tonal(
                onPressed: () {},
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
      ),
    );
  }
}

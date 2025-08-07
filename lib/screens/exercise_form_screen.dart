import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';

class ExerciseFormScreen extends StatefulWidget {
  final int id;

  const ExerciseFormScreen({super.key, required this.id});

  @override
  State<ExerciseFormScreen> createState() => _ExerciseFormScreenState();
}

class _ExerciseFormScreenState extends State<ExerciseFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  WeightType _weightType = WeightType.kg;

  @override
  void initState() {
    super.initState();

    if (widget.id == -1) {
      return;
    }

    final exerciseProvider = Provider.of<ExerciseProvider>(
      context,
      listen: false,
    );
    final exercise = exerciseProvider.exercises.firstWhere(
      (e) => e.id == widget.id,
      orElse: () => Exercise(id: -1, name: '', weightType: WeightType.kg),
    );

    _nameController.text = exercise.name;
    _weightType = exercise.weightType;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _weightType = WeightType.kg;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: widget.id == -1
            ? const Text('New exercise')
            : const Text('Edit exercise'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownMenu(
                label: const Text('Unit'),
                width: deviceSize.width - 16,
                initialSelection: _weightType,
                onSelected: (value) {
                  if (value == null) return;
                  setState(() => _weightType = value);
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(label: 'KG', value: WeightType.kg),
                  DropdownMenuEntry(label: 'LB', value: WeightType.lbs),
                ],
              ),
              FilledButton.tonal(
                onPressed: () async {
                  final exerciseProvider = context.read<ExerciseProvider>();
                  final exercise = Exercise(
                    id: widget.id,
                    name: _nameController.text,
                    weightType: _weightType,
                  );

                  // final callback = widget.id == -1
                  //     ? exerciseProvider.create(exercise)
                  //     : exerciseProvider.update(exercise);
                  final callback = widget.id == -1
                      ? exerciseProvider.create
                      : exerciseProvider.update;

                  await callback(exercise);

                  if (!context.mounted) return;
                  context.pop();

                  // callback.catchError((error) {
                  //   print(error);
                  // });
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
      ),
    );
  }
}

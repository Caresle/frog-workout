import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';

class ProgressWorkoutList extends StatefulWidget {
  const ProgressWorkoutList({super.key});

  @override
  State<ProgressWorkoutList> createState() => _ProgressWorkoutListState();
}

class _ProgressWorkoutListState extends State<ProgressWorkoutList> {
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) return;

    _isInit = true;
    Future.microtask(() {
      if (!mounted) return;

      final provider = Provider.of<RecordProvider>(context, listen: false);
      provider.getRecords();
    });
  }

  @override
  Widget build(BuildContext context) {
    final recordProvider = context.watch<RecordProvider>();

    if (recordProvider.isLoading) {
      return Flexible(child: const Center(child: CircularProgressIndicator()));
    }

    return Flexible(
      child: ListView.builder(
        itemCount: recordProvider.records.length,
        itemBuilder: (context, index) {
          final record = recordProvider.records[index];
          return Card(
            clipBehavior: Clip.hardEdge,
            child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.fitness_center_rounded),
                      const SizedBox(width: 8),
                      Text(record.exercise),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(record.weight.toString()),
                          Text(record.weightType.toUpperCase()),
                          const SizedBox(width: 2),
                          Text('x'),
                          const SizedBox(width: 2),
                          Text(record.reps.toString()),
                        ],
                      ),
                      Text(record.setType.toUpperCase()),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

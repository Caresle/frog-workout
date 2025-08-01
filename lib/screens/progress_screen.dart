import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Progress')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Overall progress'),
              const SizedBox(height: 8),
              SizedBox(
                width: size.width - 16,
                child: const Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Chart about general things (Duration, Reps, Weight, etc.)',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: size.width - 16,
                height: 200,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      clipBehavior: Clip.hardEdge,
                      child: ListTile(
                        title: Row(
                          children: [
                            Icon(Icons.timer_rounded),
                            const SizedBox(width: 8),
                            Text('Item $index'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text('Workout History'),
              const SizedBox(height: 8),
              Flexible(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      clipBehavior: Clip.hardEdge,
                      child: ListTile(
                        title: Row(
                          children: [
                            Icon(Icons.timer_rounded),
                            const SizedBox(width: 8),
                            Text('Item $index'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MainNavigationBar(selectedIndex: 2),
    );
  }
}

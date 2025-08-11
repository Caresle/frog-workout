import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/providers/providers.dart';

class SyncButton extends StatelessWidget {
  const SyncButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width - 16,
      child: FilledButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Sync Data'),
                content: const Text('Are you sure you want to sync data?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      final recordProvider = context.read<RecordProvider>();
                      final syncProvider = context.read<SyncProvider>();
                    },
                    child: Text('Sync'),
                  ),
                ],
              );
            },
          );
        },
        icon: Icon(Icons.sync_rounded),
        label: Text('Sync data'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MeasuresList extends StatelessWidget {
  const MeasuresList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            children: [
              const Text('Measure'),
              const SizedBox(width: 8),
              Text('100'),
              const Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete_rounded)),
            ],
          ),
        );
      },
    );
  }
}

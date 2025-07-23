import 'package:flutter/material.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return _ExerciseItem();
        },
      ),
    );
  }
}

class _ExerciseItem extends StatelessWidget {
  const _ExerciseItem();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: () {},
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Exercise name'),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_rounded)),
          ],
        ),
        subtitle: Row(children: [Chip(label: const Text('KG'))]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/domain/domain.dart';
import 'package:workouts_app/providers/providers.dart';
import 'package:workouts_app/widgets/widgets.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final exercise = context.watch<Exercise>();

    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: () {
          context.push('/exercises/${exercise.id}');
        },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(exercise.name), getActionsMenu(context, deviceSize)],
        ),
        subtitle: Row(
          children: [Chip(label: Text(exercise.weightType.name.toUpperCase()))],
        ),
      ),
    );
  }

  Widget getActionsMenu(BuildContext context, Size deviceSize) {
    final exercise = context.read<Exercise>();

    return Provider.value(
      value: exercise,
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: deviceSize.width - 16,
                  height: deviceSize.height * .7,
                  child: Column(
                    children: [
                      Text('Actions', style: TextStyle(fontSize: 16)),
                      DeleteExerciseButton(
                        onConfirm: (BuildContext innerContext) {
                          if (innerContext.mounted) {
                            innerContext.read<ExerciseProvider>().delete(
                              exercise,
                            );
                            innerContext.pop();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        icon: Icon(Icons.more_horiz_rounded),
      ),
    );
  }
}

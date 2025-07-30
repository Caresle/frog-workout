import 'package:flutter/material.dart';

enum SetType { warmup, normal, backoff, top, failure }

class SetTypeData {
  final String name;
  final SetType type;
  final Color color;

  const SetTypeData({
    required this.name,
    required this.type,
    required this.color,
  });
}

const setTypeList = [
  SetTypeData(name: 'Warmup', type: SetType.warmup, color: Colors.amber),
  SetTypeData(name: 'Normal', type: SetType.normal, color: Colors.blueGrey),
  SetTypeData(name: 'Backoff', type: SetType.backoff, color: Colors.blue),
  SetTypeData(name: 'Top', type: SetType.top, color: Colors.green),
  SetTypeData(name: 'Failure', type: SetType.failure, color: Colors.red),
];

SetTypeData getSetTypeData(SetType setType) {
  return setTypeList.firstWhere((element) => element.type == setType);
}

class SetTypeDisplay extends StatelessWidget {
  final SetType setType;

  const SetTypeDisplay({super.key, this.setType = SetType.normal});

  TextStyle getTextTypeStyle() {
    final data = getSetTypeData(setType);

    return TextStyle(fontWeight: FontWeight.bold, color: data.color);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: deviceSize.width,
                height: deviceSize.height * 0.5,
                child: Column(
                  children: [
                    const Text('Set Type'),
                    const SizedBox(height: 16),
                    _SetTypeList(),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Text(setType.name[0].toUpperCase(), style: getTextTypeStyle()),
    );
  }
}

class _SetTypeList extends StatelessWidget {
  const _SetTypeList();

  ButtonStyle getStyle(SetType setType) {
    final data = getSetTypeData(setType);

    return FilledButton.styleFrom(
      backgroundColor: data.color.withAlpha(20),
      foregroundColor: data.color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...setTypeList.map(
          (setType) => FilledButton.tonal(
            style: getStyle(setType.type),
            onPressed: () {},
            child: Row(
              children: [
                Text(setType.name.substring(0, 1).toUpperCase()),
                const SizedBox(width: 8),
                Text(setType.name),
              ],
            ),
          ),
        ),
        FilledButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.close_rounded),
              const SizedBox(width: 8),
              Text('Remove set'),
            ],
          ),
        ),
      ],
    );
  }
}

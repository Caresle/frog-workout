import 'package:flutter/material.dart';

class WrapperCell extends StatelessWidget {
  final Widget? child;
  final bool isLast;
  final bool isFirst;
  final bool isComplete;

  const WrapperCell({
    super.key,
    this.child,
    this.isFirst = false,
    this.isLast = false,
    this.isComplete = false,
  });

  BorderRadiusGeometry? getBorderRadius() {
    final radius = Radius.circular(8);

    if (isFirst) {
      return BorderRadius.only(topLeft: radius, bottomLeft: radius);
    }

    if (isLast) {
      return BorderRadius.only(topRight: radius, bottomRight: radius);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isComplete ? Colors.blue.shade600.withAlpha(50) : null,
        borderRadius: getBorderRadius(),
      ),
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: child,
    );
  }
}

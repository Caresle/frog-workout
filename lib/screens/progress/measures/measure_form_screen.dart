import 'package:flutter/material.dart';

class MeasureFormScreen extends StatelessWidget {
  const MeasureFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add measure')),
      body: SafeArea(child: Center(child: Text('Add measure screen'))),
    );
  }
}

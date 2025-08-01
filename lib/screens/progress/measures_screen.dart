import 'package:flutter/material.dart';

class MeasuresScreen extends StatelessWidget {
  const MeasuresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Measures')),
      body: SafeArea(child: Text('Measures')),
    );
  }
}

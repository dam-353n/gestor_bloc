
import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Counter Screen'),
      ),
      body: const Center(
        child: Text('BLoC Counter Screen Body'),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  static const title = 'Memorize game';

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: const Center(
        child: Text(title),
      ),
    );
  }
}

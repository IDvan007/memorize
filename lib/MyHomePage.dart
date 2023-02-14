import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  static const textgame = 'title';

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(textgame),
      ),
      body: const Center(
        child: Text(textgame),
      ),
    );
  }
}

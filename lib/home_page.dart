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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _MyIcon(),
                _MgBox(),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _MgBox(),
                _MyIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MyIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(width: 3, color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.lightbulb,
        color: Colors.green,
        size: 32.0,
      ),
    );
  }
}

class _MgBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(width: 3, color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Memorize game',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18, // высота шрифта 18
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  static const title = 'Memorize game';


  MyHomePage({super.key});

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
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MyIcon(),
                const SizedBox(width: 30.0),
                _MgBox(),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _MgBox(),
                const SizedBox(width: 30.0),
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
        Icons.rocket_launch_outlined,
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

import 'package:flutter/material.dart';

class MyHomeGame extends StatelessWidget {
  const MyHomeGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _MyCard(myIcon: '\u{1F680}'),
              _MyCard(myIcon: '\u{1F681}'),
              _MyCard(myIcon: '\u{1F68C}'),
              _MyCard(myIcon: '\u{1F682}'),
            ],
          ),
        ),
    );
  }
}

class _MyCard extends StatelessWidget {
  String myIcon = '\u{1F680}';

  _MyCard({required this.myIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 3, color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Align(
          child: Text(
            myIcon,
            style: const TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}

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
          children: const [
            _MyCard(myIcon: '\u{1F680}'), //Rocket
            _MyCard(myIcon: '\u{1F681}'), //Helicopter
            _MyCard(myIcon: '\u{1F68C}'), //Bus
            _MyCard(myIcon: '\u{1F682}'), //Locomotive
          ],
        ),
      ),
    );
  }
}

class _MyCard extends StatelessWidget {
  final String myIcon;

  const _MyCard({required this.myIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 3, color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Align(
          child: Text(myIcon, style: const TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}

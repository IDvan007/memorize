import 'package:flutter/material.dart';
import 'package:memorize/my_card.dart';

class MyHomeGame extends StatelessWidget {
  const MyHomeGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(4),
        child: Row(
          children: [
            Expanded(child: MyCard(myIcon: '\u{1F680}')), //Rocket
            SizedBox(width: 10.0),
            Expanded(child: MyCard(myIcon: '\u{1F681}')), //Helicopter
            SizedBox(width: 10.0),
            Expanded(child: MyCard(myIcon: '\u{1F68C}')), //Bus
            SizedBox(width: 10.0),
            Expanded(child: MyCard(myIcon: '\u{1F682}')), //Locomotive
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memorize/my_card.dart';

class MyHomeGame extends StatefulWidget {
  MyHomeGame({super.key});

  final iconList = <String>[
    '\u{1F680}',
    '\u{1F681}',
    '\u{1F68C}',
    '\u{1F682}',
    '\u{1F6F8}',
    '\u{1F6F0}',
    '\u{1F6A0}',
    '\u{1F6E9}',
    '\u{1F6A2}',
    '\u{1F6F6}',
    '\u{1FA82}',
    '\u{1F6B4}',
    '\u{1F686}',
    '\u{1F691}',
    '\u{1F692}',
    '\u{1F694}',
    '\u{1F3CD}',
    '\u{1F6F4}',
    '\u{1F6B2}',
    '\u{1F6F5}',
    '\u{1F3CE}',
    '\u{1F69C}',
    '\u{1F69A}',
    '\u{1F697}',
    '\u{1F695}'
  ];

  @override
  State<MyHomeGame> createState() => _MyHomeGameState();
}

class _MyHomeGameState extends State<MyHomeGame> {
  Random myRand = Random();
  int tempCounter = 0;
  static int myCardPerRow = 4;
  static int myCounter = 8;

  void _incrementCounter() {
    setState(() {
      myCounter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      myCounter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Memorize!',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                    textAlign: TextAlign.justify)
              ],
            ),
            for (int j = 0; j <= (myCounter / myCardPerRow).floor() - 1; j++)
              Expanded(
                  child: Row(children: [
                for (int i = 0; i <= myCardPerRow - 1; i++)
                  Expanded(
                    child: MyCard(myIcon: widget.iconList[i]),
                  )
              ])),
            if ((myCounter / myCardPerRow) !=
                (myCounter / myCardPerRow).floor())
              Expanded(
                  child: Row(children: [
                for (int i = 0;
                    i <=
                        myCounter -
                            ((myCounter / myCardPerRow).floor() *
                                myCardPerRow) -
                            1;
                    i++)
                  Expanded(child: MyCard(myIcon: widget.iconList[i])),
              ])),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 4),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: const Text('-',
                        style: TextStyle(color: Colors.blue, fontSize: 36)),
                    onPressed: () => {_decrementCounter()},
                  ),
                ),
                const SizedBox(width: 10.0),
                const Expanded(
                    child: Text('Shuffle',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 28,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center)),
                const SizedBox(width: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 4),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: const Text('+',
                        style: TextStyle(color: Colors.blue, fontSize: 36)),
                    onPressed: () => {_incrementCounter()},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

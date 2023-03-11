import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memorize/my_card.dart';

class MyHomeGame extends StatefulWidget {
  const MyHomeGame({super.key});

  static var myContainers = [];
  static int myCounter = 8;

  static const List<String> iconList = [
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
  static MyCard tempContainer = const MyCard(myIcon: ' ');

  void myInitCards() {
    MyHomeGame.myContainers.clear();
    for (int i = 0; i < MyHomeGame.myCounter; i++) {
      tempContainer = MyCard(myIcon: MyHomeGame.iconList[i]);
      MyHomeGame.myContainers.add(tempContainer);
    }
  }

  void _incrementCounter() {
    setState(() {
      MyHomeGame.myContainers
          .add(MyCard(myIcon: MyHomeGame.iconList[MyHomeGame.myCounter + 1]));
      MyHomeGame.myCounter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      MyHomeGame.myContainers.removeLast();
      MyHomeGame.myCounter--;
    });
  }

  @override
  void initState() {
    super.initState();
    myInitCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Memorize!',
            style: TextStyle(
                fontSize: 28, color: Colors.black, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: Center(
          child: Expanded(
            child: Container(
              color: Colors.white,
              child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 2,
                  children: [
                    for (int i = 0; i < MyHomeGame.myContainers.length; i++)
                      MyHomeGame.myContainers[i],
                  ]),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 4),
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.remove),
                color: Colors.blue,
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
              child: IconButton(
                icon: const Icon(Icons.add),
                color: Colors.blue,
                onPressed: () => {_incrementCounter()},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

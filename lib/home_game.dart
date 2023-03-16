import 'package:flutter/material.dart';
import 'package:memorize/my_card.dart';

class MyHomeGame extends StatefulWidget {
  const MyHomeGame({super.key});
  static String card1='';
  static String card2='';
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
  int myCounter = 8;
  //List <String> cardList = ['\u{1F682}','\u{1F680}','\u{1F681}','\u{1F681}','\u{1F68C}', '\u{1F680}', '\u{1F68C}', '\u{1F682}'];
  List <String> cardList = [];
  @override
  void initState() {
    for (int i=0; i<myCounter/2; i++){
      cardList.add(MyHomeGame.iconList[i]);
      cardList.add(MyHomeGame.iconList[i]);
    }
    cardList.shuffle();
    super.initState();
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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    childAspectRatio: 2 / 3,
                    children: cardList
                        .take(myCounter)
                        .map((icon) => MyCard(myIcon: icon))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

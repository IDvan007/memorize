import 'package:flutter/material.dart';
import 'package:memorize/my_card.dart';

class MyHomeGame extends StatefulWidget {
  const MyHomeGame({super.key});
  static MyCard openCard = MyCard(myIcon: ' ', cardPoz: -1);//Position opened first card
  static List<MyCard> cardList=[];
  static List <String> cardIcons = []; //shuffled Icons of Cards
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

  void _handleTap() {
    setState(() {

    });
  }


  @override
  void initState() {
    for (int i=0; i<myCounter/2; i++){
      MyHomeGame.cardIcons.add(MyHomeGame.iconList[i]);
      MyHomeGame.cardIcons.add(MyHomeGame.iconList[i]);
    }
    MyHomeGame.cardIcons.shuffle();//  shuffle Icons
    for (int i=0; i<MyHomeGame.cardIcons.length;i++){
      MyHomeGame.cardList.add(MyCard(myIcon:MyHomeGame.cardIcons[i],cardPoz: i));
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(MyHomeGame.openCard.cardPoz.toString(),
            style: const TextStyle(
                fontSize: 28, color: Colors.black, fontWeight: FontWeight.w800),
            textAlign: TextAlign.center),
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: _handleTap,
        child: SafeArea(
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
                      children: [
                        for (int i=0;i<MyHomeGame.cardList.length; i++) MyHomeGame.cardList[i],
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

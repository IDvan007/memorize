import 'package:flutter/material.dart';
import 'package:memorize/home_game.dart';
import 'package:memorize/my_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static MyCard tempContainer = const MyCard(myIcon: ' ');

  void _initCards() {
    MyHomeGame.myContainers.clear();
    for (int i = 0; i < MyHomeGame.myCounter; i++) {
      tempContainer = MyCard(myIcon: MyHomeGame.iconList[i]);
      MyHomeGame.myContainers.add(tempContainer);
    }
  }

  @override
  Widget build(BuildContext context) {
    _initCards();
    return const MaterialApp(
      home: MyHomeGame(),
    );
  }
}

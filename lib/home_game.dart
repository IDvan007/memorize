import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memorize/button.dart';
import 'package:memorize/my_card.dart';

class MyHomeGame extends StatefulWidget {
  const MyHomeGame({super.key});

  static const iconList = <String>[
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(4),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Memorize!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                  textAlign: TextAlign.justify)
            ],
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
                const SizedBox(width: 10.0),
                Expanded(
                    child: MyCard(
                        myIcon: MyHomeGame.iconList[
                            myRand.nextInt(MyHomeGame.iconList.length - 1)])),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SizedBox(width: 10.0),
              MyButton(minusPlus: '-'),
              SizedBox(width: 10.0),
              Expanded(
                  child: Text('Shuffle',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 28,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center)),
              SizedBox(width: 10.0),
              MyButton(minusPlus: '+'),
              SizedBox(width: 10.0),
            ],
          ),
        ]),
      ),
    );
  }
}

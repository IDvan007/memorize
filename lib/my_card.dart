import 'package:flutter/material.dart';

import 'home_game.dart';

class MyCard extends StatefulWidget {
  final String myIcon;
  bool cardVisible = true;
  bool cardActive = false;
  int cardPoz;

  MyCard({
    super.key,
    required this.myIcon,
    required this.cardPoz,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  void _handleTap() {
    setState(() {
      print("Card was taped!");
      print("openCard.cardPoz: ${MyHomeGame.openCard.cardPoz}");
      if (MyHomeGame.cardList[widget.cardPoz].cardVisible == true) {
        if (MyHomeGame.openCard.cardPoz == -1) {
          MyHomeGame.openCard.cardPoz = widget.cardPoz;
          print("widget.cardPoz: ${widget.cardPoz}");
          print("openCard.cardPoz: ${MyHomeGame.openCard.cardPoz}");
          MyHomeGame.cardList[widget.cardPoz].cardActive =
          !MyHomeGame.cardList[widget.cardPoz].cardActive;
          print("cardList[${widget.cardPoz}].cardActive: ${MyHomeGame
              .cardList[widget.cardPoz].cardActive}");
        } else {
          if (MyHomeGame.openCard.cardPoz != widget.cardPoz) {
            MyHomeGame.cardList[widget.cardPoz].cardActive =
            !MyHomeGame.cardList[widget.cardPoz].cardActive;
            if (MyHomeGame.cardList[widget.cardPoz].myIcon ==
                MyHomeGame.cardList[MyHomeGame.openCard.cardPoz].myIcon) {
              MyHomeGame.cardList[widget.cardPoz].cardVisible = false;
              MyHomeGame.cardList[MyHomeGame.openCard.cardPoz].cardVisible =
              false;
              print("MyHomeGame.cardList[${widget.cardPoz}].myIcon: ${MyHomeGame.cardList[widget.cardPoz].myIcon}");
              print("MyHomeGame.cardList[${MyHomeGame.openCard.cardPoz}].myIcon: ${MyHomeGame.cardList[MyHomeGame.openCard.cardPoz].myIcon}");
              print("MyHomeGame.cardList[${widget.cardPoz}].cardVisible: ${MyHomeGame.cardList[widget.cardPoz].cardVisible}");
              print("MyHomeGame.cardList[${MyHomeGame.openCard.cardPoz}].cardVisible: ${MyHomeGame.cardList[MyHomeGame.openCard.cardPoz].cardVisible}");
              MyHomeGame.openCard.cardPoz = -1;
            } else {
              MyHomeGame.cardList[widget.cardPoz].cardActive = false;
              MyHomeGame.cardList[MyHomeGame.openCard.cardPoz].cardActive =
              false;
              print("MyHomeGame.cardList[${widget.cardPoz}].cardActive: ${MyHomeGame.cardList[widget.cardPoz].cardActive}");
              print("MyHomeGame.cardList[${MyHomeGame.openCard.cardPoz}].cardActive: ${MyHomeGame.cardList[MyHomeGame.openCard.cardPoz].cardActive}");

            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        child: Container(
          decoration: BoxDecoration(
            color: MyHomeGame.cardList[widget.cardPoz].cardVisible
                ? MyHomeGame.cardList[widget.cardPoz].cardActive
                    ? Colors.white
                    : Colors.blue
                : Colors.white,
            border: MyHomeGame.cardList[widget.cardPoz].cardVisible
                ? Border.all(width: 3, color: Colors.red)
                : Border.all(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Align(
            child: Text(
                MyHomeGame.cardList[widget.cardPoz].cardVisible
                    ? MyHomeGame.cardList[widget.cardPoz].cardActive
                        ? MyHomeGame.cardList[widget.cardPoz].myIcon
                        : ' '
                    : ' ',
                style: const TextStyle(fontSize: 25)),
          ),
        ),
      ),
    );
  }
}

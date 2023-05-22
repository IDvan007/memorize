import 'package:flutter/material.dart';
import 'home_game.dart';

class MyCard extends StatefulWidget {
   final String myIcon;
   bool cardVisible = true; // I also decided to add these two fields into constructor
   bool cardActive = true;
   int cardPoz;
  Function() notifyParent; // this variable will store callback link

  MyCard({
    super.key,
    required this.myIcon,
    required this.cardPoz,
    required this.cardActive,
    required this.cardVisible,
    required this.notifyParent,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  int tempPoz=0;

  void _handleTap() {
    //setState(() { // this call will not work with callback, I don't know why as I said previously
      print("Card was taped!");
      print("openCard.cardPoz: ${MyHomeGame.openCardPoz}");
      if (MyHomeGame.cardList[widget.cardPoz].cardVisible == true && MyHomeGame.onPreview == false ) {
        if (MyHomeGame.openCardPoz == -1) { // first card selected, posision stored
          MyHomeGame.openCardPoz = widget.cardPoz;
          print("widget.cardPoz: ${widget.cardPoz}");
          print("openCard.cardPoz: ${MyHomeGame.openCardPoz}");
          MyHomeGame.cardList[widget.cardPoz].cardActive =
          !MyHomeGame.cardList[widget.cardPoz].cardActive;
          print("cardList[${widget.cardPoz}].cardActive: ${MyHomeGame
              .cardList[widget.cardPoz].cardActive}");
          widget.notifyParent();
        } else { // second card selected, we can compare now
          if (MyHomeGame.openCardPoz != widget.cardPoz) { // tapped card is not the first open card
            MyHomeGame.cardList[widget.cardPoz].cardActive =
            !MyHomeGame.cardList[widget.cardPoz].cardActive;
            widget.notifyParent();
            if (MyHomeGame.cardList[widget.cardPoz].myIcon ==
                MyHomeGame.cardList[MyHomeGame.openCardPoz].myIcon) { // two cards have the same icon
              //setState(() {
              tempPoz =MyHomeGame.openCardPoz;
              MyHomeGame.openCardPoz = -1;
              Future.delayed(const Duration(milliseconds: 750),(){
// what you want to do after 1 second
                MyHomeGame.cardList[widget.cardPoz].cardVisible = false;
                MyHomeGame.cardList[tempPoz].cardVisible = false;
                print("MyHomeGame.cardList[${widget.cardPoz}].myIcon: ${MyHomeGame.cardList[widget.cardPoz].myIcon}");
                print("MyHomeGame.cardList[$tempPoz].myIcon: ${MyHomeGame.cardList[tempPoz].myIcon}");
                print("MyHomeGame.cardList[${widget.cardPoz}].cardVisible: ${MyHomeGame.cardList[widget.cardPoz].cardVisible}");
                print("MyHomeGame.cardList[$tempPoz].cardVisible: ${MyHomeGame.cardList[tempPoz].cardVisible}");
                widget.notifyParent();
                MyHomeGame.cardsCount--;
              });

             // });

            } else { // icons are not the same
              // setState(() {
              tempPoz =MyHomeGame.openCardPoz;
              MyHomeGame.openCardPoz = -1;

              Future.delayed(const Duration(milliseconds: 750), () {
// what you want to do after 1 second
                MyHomeGame.cardList[widget.cardPoz].cardActive = false;
                MyHomeGame.cardList[tempPoz].cardActive = false;
                print("MyHomeGame.cardList[${widget
                    .cardPoz}].cardActive: ${MyHomeGame.cardList[widget.cardPoz]
                    .cardActive}");
                print("MyHomeGame.cardList[$tempPoz].cardActive: ${MyHomeGame.cardList[tempPoz].cardActive}");
                widget.notifyParent();
              });
              // });
            }
          }
        }
      }
    //});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
      _handleTap,
      //(){
        // [1] without card setState
        // widget.cardActive = !widget.cardActive; // without setState() call - will not work
        // [2] with card setState
        // setState(() {
        //   widget.cardActive = !widget.cardActive; // with setState() call
        // });
        // [3] with parent setState
        // MyHomeGame.cardList[widget.cardPoz].cardActive = !MyHomeGame.cardList[widget.cardPoz].cardActive;
        // MyHomeGame.openCardPoz = widget.cardPoz;
        // widget.notifyParent();
     // },
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

          child: MyHomeGame.cardList[widget.cardPoz].cardVisible
               ? MyHomeGame.cardList[widget.cardPoz].cardActive
               ? Image.asset(MyHomeGame.cardList[widget.cardPoz].myIcon)
               : const Text(' ')
               : const Text(' '),
        ),
      ),
    );
  }

}
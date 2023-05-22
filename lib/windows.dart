import 'package:flutter/material.dart';
import 'package:memorize/home_game.dart';
import 'package:memorize/my_card.dart';
import 'dart:async';


class DialogExample extends StatefulWidget {
  Function() notifyParent; // this variable will store callback link
  DialogExample({super.key, required this.notifyParent});
  @override
  State<DialogExample> createState() => _DialogExampleState();
}


class _DialogExampleState extends State<DialogExample> {

  void onRestart() {
    MyHomeGame.openCardPoz = -1; //Position opened first card
    MyHomeGame.onGame = false;
    MyHomeGame.onPreview = true;
    MyHomeGame.cardList = [];
    MyHomeGame.cardIcons = [];
    MyHomeGame.timerSecLeft = 7;
    widget.notifyParent();
  }

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: const Text('You WIN!!!', textAlign: TextAlign.center,),
      content:  Text('Your time is ${MyHomeGame.timerSecLeft} seconds',textAlign: TextAlign.center, ),
      actions:  <Widget>[
        TextButton(
          onPressed:onRestart,
          child: const Center(child: Text('OK')),
        ),
      ],
    );
  }
}

class _BeautifulButton extends StatelessWidget {
  Function() onPressed;
  Color color1;
  Color color2;
  String dataText;
  int starsCount;

   _BeautifulButton({required this.onPressed, required this.color1,required this.color2,required this.dataText,required this.starsCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: color1,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.black45,
                        spreadRadius: 0.5,
                        offset: Offset(3, 4))
                  ]),
            ),
            Container(
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: color2,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        color: Colors.black12,
                        spreadRadius: 0.3,
                        offset: Offset(
                          5,
                          3,
                        ))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Center(
                      child: Text(
                        dataText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                blurRadius: 2,
                                offset: Offset(1, 2),
                              ),
                              Shadow(
                                  color: Colors.green,
                                  blurRadius: 2,
                                  offset: Offset(0.5, 2))
                            ]),
                      )),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    children: [for (int i=0; i<starsCount; i++)
                      const Icon(
                         Icons.star,
                         color: Colors.yellow,
                      ),
                    ],
                      ),
                    ],
                  ),),
                ],
              ),
            ));
  }
}

class DifficultySelection extends StatefulWidget {
  Function() notifyParent; // this variable will store callback link
  DifficultySelection({super.key, required this.notifyParent});

  @override
  State<DifficultySelection> createState() => _DifficultySelectionState();
}

class _DifficultySelectionState extends State<DifficultySelection> {
  bool bogDanka = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Memorize Game',
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
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      _BeautifulButton(onPressed:  onPressedEasy, color1:Colors.green, color2:Colors.green.shade300, dataText: "Easy level",starsCount: 1, ),
                      const SizedBox(height: 50),
                      _BeautifulButton(onPressed:  onPressedMedium, color1:Colors.orange, color2:Colors.orange.shade300, dataText: "Medium level",starsCount: 2, ),
                      const SizedBox(height: 50),
                      _BeautifulButton(onPressed:  onPressedHard, color1:Colors.red, color2:Colors.red.shade300, dataText: "Hard level",starsCount: 3, ),
                      const SizedBox(height: 50),
                      _BeautifulButton(onPressed:  onPressedBodya, color1:Colors.purple, color2:Colors.purple.shade300, dataText: "Bogdanka Edition)))",starsCount: 5, ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressedEasy() {
    MyHomeGame.onGame = true;
    MyHomeGame.levelGame = 12;
    MyHomeGame.cardsCount = 6;
    print('MyHomeGame.onGame  ${MyHomeGame.onGame}');
    prepearLevel();
    widget.notifyParent();
    onPreview();
  }

  void onPressedMedium() {
    MyHomeGame.onGame = true;
    MyHomeGame.levelGame = 16;
    MyHomeGame.cardsCount = 8;
    print('MyHomeGame.onGame  ${MyHomeGame.onGame}');
    prepearLevel();
    widget.notifyParent();
    onPreview();
  }

  void onPressedHard() {
    MyHomeGame.onGame = true;
    MyHomeGame.levelGame = 20;
    MyHomeGame.cardsCount = 10;
    print('MyHomeGame.onGame  ${MyHomeGame.onGame}');
    prepearLevel();
    widget.notifyParent();
    onPreview();
  }

  void onPressedBodya() {
    MyHomeGame.onGame = true;
    MyHomeGame.levelGame = 16;
    MyHomeGame.cardsCount = 8;
    print('MyHomeGame.onGame  ${MyHomeGame.onGame}');
    bogDanka = true;
    prepearLevel();
    widget.notifyParent();
    onPreview();
  }

  void _startCountDown(){
    Timer.periodic(const Duration(seconds: 1) ,  (timer) {
        if (MyHomeGame.timerSecLeft>0) {
          MyHomeGame.timerSecLeft--;
        }
        else{
          timer.cancel();
        }
        widget.notifyParent();
    });
  }

  void _startCountUp(){
    Timer.periodic(const Duration(seconds: 1) ,  (timer) {
        if (!MyHomeGame.onPreview && MyHomeGame.cardsCount > 0) {
          MyHomeGame.timerSecLeft++;
        }
        else{
          timer.cancel();
        }
        widget.notifyParent();
    });
  }

  void onPreview() {
    print('MyHomeGame.onPreview  ${MyHomeGame.onPreview}');
    if (MyHomeGame.onPreview) {
      _startCountDown();
      print('Future.delayed Started   7 Sec');
      Future.delayed(const Duration(seconds: 7), () {
        MyHomeGame.onPreview = false;
        for (var element in MyHomeGame.cardList) {
          element.cardActive = false;
        }

        widget.notifyParent();
        print('Future.delayed Ended');
        _startCountUp();
      });
    }
  }

  void prepearLevel() {
    if (bogDanka) {
      for (int i = 0; i < MyHomeGame.levelGame / 2; i++) {
        MyHomeGame.cardIcons.add(MyHomeGame.iconListBodya[i]);
        MyHomeGame.cardIcons.add(MyHomeGame.iconListBodya[i]);
      }
    } else {
      for (int i = 0; i < MyHomeGame.levelGame / 2; i++) {
        MyHomeGame.cardIcons.add(MyHomeGame.iconList[i]);
        MyHomeGame.cardIcons.add(MyHomeGame.iconList[i]);
      }
    }
    MyHomeGame.cardIcons.shuffle(); //  shuffle Icons
    for (int i = 0; i < MyHomeGame.cardIcons.length; i++) {
      // here we fill cardList with default cards
      MyHomeGame.cardList.add(MyCard(
        myIcon: MyHomeGame.cardIcons[i],
        cardPoz: i,
        cardActive: true,
        cardVisible: true,
        notifyParent: widget.notifyParent,
      ) // it does not matter what you put here now, we will put our callback later
          );
    }
  }
}

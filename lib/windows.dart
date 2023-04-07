import 'package:flutter/material.dart';
import 'package:memorize/home_game.dart';
import 'package:memorize/my_card.dart';

class DifficultySelection  extends StatefulWidget {
  Function() notifyParent; // this variable will store callback link
  DifficultySelection({super.key , required this.notifyParent});

@override
State<DifficultySelection> createState() => _DifficultySelectionState();
}

class _DifficultySelectionState extends State<DifficultySelection> {

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
                  ElevatedButton(onPressed: onPressedEasy, child: const Text("Easy level")),
                  const SizedBox(height: 50),
                  ElevatedButton(onPressed: onPressedMedium, child: const Text("Medium level")),
                  const SizedBox(height: 50),
                  ElevatedButton(onPressed: onPressedHard, child: const Text("Hard level")),
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
        print('MyHomeGame.onGame  ${MyHomeGame.onGame}');
        prepearLevel();
        widget.notifyParent();
        onPreview();

  }

  void onPressedMedium() {

      MyHomeGame.onGame = true;
      MyHomeGame.levelGame = 16;
      print('MyHomeGame.onGame  ${MyHomeGame.onGame}');
      prepearLevel();
      widget.notifyParent();
      onPreview();
  }

  void onPressedHard() {

      MyHomeGame.onGame = true;
      MyHomeGame.levelGame = 20;
      print('MyHomeGame.onGame  ${MyHomeGame.onGame}');
      prepearLevel();
      widget.notifyParent();
      onPreview();

  }

void onPreview(){
  print('MyHomeGame.onPreview  ${MyHomeGame.onPreview}');
  if (MyHomeGame.onPreview) {
    print('Future.delayed Started   7 Sec');
    Future.delayed(const Duration(seconds: 7),(){
        MyHomeGame.onPreview=false;
        for (var element in MyHomeGame.cardList) {element.cardActive=false;}
        widget.notifyParent();
        print('Future.delayed Ended');
    });
  }}

void prepearLevel(){

  for (int i=0; i<MyHomeGame.levelGame/2; i++){
    MyHomeGame.cardIcons.add(MyHomeGame.iconList[i]);
    MyHomeGame.cardIcons.add(MyHomeGame.iconList[i]);
  }
  MyHomeGame.cardIcons.shuffle();//  shuffle Icons
  for (int i=0; i<MyHomeGame.cardIcons.length;i++){ // here we fill cardList with default cards
    MyHomeGame.cardList.add(
        MyCard(
          myIcon:MyHomeGame.cardIcons[i],
          cardPoz: i,
          cardActive: true,
          cardVisible: true,
          notifyParent: widget.notifyParent,) // it does not matter what you put here now, we will put our callback later
    );
  }

}

}
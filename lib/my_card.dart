import 'package:flutter/material.dart';
import 'home_game.dart';

class MyCard extends StatefulWidget {
  final String myIcon;

  const MyCard({
    super.key,
    required this.myIcon,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
      compareCards();
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
            color: _active ? Colors.white : Colors.blue,
            border: Border.all(width: 3, color: Colors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Align(
            child: Text(_active ? widget.myIcon : ' ',
                style: const TextStyle(fontSize: 25)),
          ),
        ),
      ),
    );
  }

  void compareCards() {
      if (MyHomeGame.card1==''){
        MyHomeGame.card1=widget.myIcon;
      } else {
        MyHomeGame.card2=widget.myIcon;
      }
  }
}

import 'package:flutter/material.dart';
import 'package:memorize/my_card.dart';

class MyHomeGame extends StatefulWidget {
  const MyHomeGame({super.key});

  @override
  State<MyHomeGame> createState() => _MyHomeGameState();
}
class _MyHomeGameState extends State<MyHomeGame> {
  bool _activeR = false;
  bool _activeH = false;
  bool _activeB = false;
  bool _activeL = false;

  void _handleTapboxChangedR(bool newValue) {
    setState(() {
      _activeR = newValue;
    });
  }
  void _handleTapboxChangedH(bool newValue) {
    setState(() {
      _activeH = newValue;
    });
  }
  void _handleTapboxChangedB(bool newValue) {
    setState(() {
      _activeB = newValue;
    });
  }
  void _handleTapboxChangedL(bool newValue) {
    setState(() {
      _activeL = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(4),
        child: Row(
          children:  [
            Expanded(child: MyCard(active: _activeR, onChanged: _handleTapboxChangedR,myIcon: '\u{1F680}')),  //Rocket
            const SizedBox(width: 10.0),
            Expanded(child: MyCard(active: _activeH, onChanged: _handleTapboxChangedH,myIcon: '\u{1F681}')), //Helicopter
            const SizedBox(width: 10.0),
            Expanded(child: MyCard(active: _activeB, onChanged: _handleTapboxChangedB,myIcon: '\u{1F68C}')), //Bus
            const SizedBox(width: 10.0),
            Expanded(child: MyCard(active: _activeL, onChanged: _handleTapboxChangedL,myIcon: '\u{1F682}')), //Locomotive
          ],
        ),
      ),
    );
  }
}


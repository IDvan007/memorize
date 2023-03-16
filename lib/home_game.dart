import 'package:flutter/material.dart';
import 'package:memorize/my_card.dart';

class MyHomeGame extends StatefulWidget {
  const MyHomeGame({super.key});

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
                    children: MyHomeGame.iconList
                        .take(myCounter)
                        .map((icon) => MyCard(myIcon: icon))
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 4),
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          icon: const Icon(Icons.remove),
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              if (myCounter > 8) {
                                myCounter--;
                              }
                            });
                          }),
                    ),
                    const SizedBox(width: 10.0),
                    const Expanded(
                        child: Text('Shuffle',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 28,
                                fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center)),
                    const SizedBox(width: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 4),
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            if (myCounter < MyHomeGame.iconList.length) {
                              myCounter++;
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

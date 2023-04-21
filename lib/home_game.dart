import 'package:flutter/material.dart';
import 'package:memorize/my_card.dart';
import 'package:memorize/windows.dart';

class MyHomeGame extends StatefulWidget {
  const MyHomeGame({super.key});
  // static MyCard openCard = MyCard(myIcon: ' ', cardPoz: -1);
  static int openCardPoz = -1; //Position opened first card
  static bool onGame= false;
  static bool onPreview= true;  // show cards opened some seconds
  static int levelGame = 0;
  static List<MyCard> cardList=[];
  static List <String> cardIcons = []; //shuffled Icons of Cards
  // static const List<String> iconList = [
  //   '\u{1F680}',
  //   '\u{1F681}',
  //   '\u{1F68C}',
  //   '\u{1F682}',
  //   '\u{1F6F8}',
  //   '\u{1F6F0}',
  //   '\u{1F6A0}',
  //   '\u{1F6E9}',
  //   '\u{1F6A2}',
  //   '\u{1F6F6}',
  //   '\u{1FA82}',
  //   '\u{1F6B4}',
  //   '\u{1F686}',
  //   '\u{1F691}',
  //   '\u{1F692}',
  //   '\u{1F694}',
  //   '\u{1F3CD}',
  //   '\u{1F6F4}',
  //   '\u{1F6B2}',
  //   '\u{1F6F5}',
  //   '\u{1F3CE}',
  //   '\u{1F69C}',
  //   '\u{1F69A}',
  //   '\u{1F697}',
  //   '\u{1F695}'
  // ];

  static const List<String> iconList = [
    'assets/anc/aspirin.jpg',
    'assets/anc/citramon.jpg',
    'assets/anc/emkost.jpg',
    'assets/anc/gematogen.jpg',
    'assets/anc/korvalment.jpg',
    'assets/anc/nimesil.jpg',
    'assets/anc/pankreatin.jpg',
    'assets/anc/plastir.jpg',
    'assets/anc/shpric.jpg',
    'assets/anc/valeriana.jpg'
  ];
  static const List<String> iconListBodya = [
    'assets/Bodya/1.jpg',
    'assets/Bodya/2.jpg',
    'assets/Bodya/3.jpg',
    'assets/Bodya/4.jpg',
    'assets/Bodya/5.jpg',
    'assets/Bodya/6.jpg',
    'assets/Bodya/7.jpg',
    'assets/Bodya/8.jpg'
  ];

  @override
  State<MyHomeGame> createState() => _MyHomeGameState();
}

class _MyHomeGameState extends State<MyHomeGame> {
  int myCounter = 8;

  void _handleTap() {
    setState(() {
      print("MyHomeGame was taped!");
    });
  }

  // this function does nothing but refresh parent UI, all gridview with cards in it
  void refresh(){
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MyHomeGame.onGame ? Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              child: Text('Memorize game',
                    style: TextStyle(
                fontSize: 28, color: Colors.black, fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center),
            ),
            const SizedBox(width: 20,),
            ElevatedButton(onPressed:  onRestart, child: const Text('Restart'),)
          ],
        ),
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
                        // children: [for (int i=0; i<MyHomeGame.cardList.length; i++ ) MyHomeGame.cardList[i],
                        //
                        //   ]
                        children:
                        List.generate(MyHomeGame.cardList.length, (index) {
                            return MyCard(
                                myIcon:MyHomeGame.cardIcons[index],
                                cardPoz: index,
                                cardActive: false,
                                cardVisible: true,
                                notifyParent: refresh,
                            );
                        }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        :  DifficultySelection(notifyParent: refresh,);
  }

  void onRestart() {

    setState(() {
      MyHomeGame.openCardPoz = -1; //Position opened first card
      MyHomeGame.onGame= false;
      MyHomeGame.onPreview= true;
      MyHomeGame.cardList=[];
      MyHomeGame.cardIcons = [];
    });

    // for (int i=0; i<MyHomeGame.levelGame/2; i++){
    //   MyHomeGame.cardIcons.add(MyHomeGame.iconList[i]);
    //   MyHomeGame.cardIcons.add(MyHomeGame.iconList[i]);
    // }
    // MyHomeGame.cardIcons.shuffle();//  shuffle Icons
    // for (int i=0; i<MyHomeGame.cardIcons.length;i++){ // here we fill cardList with default cards
    //   MyHomeGame.cardList.add(
    //       MyCard(
    //         myIcon:MyHomeGame.cardIcons[i],
    //         cardPoz: i,
    //         cardActive: false,
    //         cardVisible: true,
    //         notifyParent: refresh,) // it does not matter what you put here now, we will put our callback later
    //   );
    // }

  }
}

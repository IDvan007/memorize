import 'package:flutter/material.dart';
//import 'package:memorize/home_page.dart';
import 'package:memorize/home_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomeGame(),
    );
  }
}

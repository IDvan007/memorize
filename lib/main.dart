import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const textgame = 'Memorize game';
  const MyHomePage({super.key});

//  @override
  // State<MyHomePage> createState() => _MyHomePageState();
// }

//class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(textgame),
      ),
      body: const Center(
        child: Text(textgame),
      ),
    );
  }

}

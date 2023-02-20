import 'package:flutter/material.dart';

class MyHomeGame extends StatelessWidget {
  const MyHomeGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5,40,5,5,),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 3, color: Colors.blue),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text('\u{1F680} ', style: TextStyle( fontSize: 60),),
            ),
          ),
        ),
      ),
    );
  }
}

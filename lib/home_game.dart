import 'package:flutter/material.dart';


class MyHomeGame extends StatelessWidget {
  const MyHomeGame({super.key});


  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const  EdgeInsets.fromLTRB(5,40.0,5,5),
        child:Container(
          decoration: BoxDecoration(
            // color: Colors.yellow,
            border: Border.all(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(12),
          ),
          /*child: const Icon(
          Icons.rocket_launch_outlined,
          color: Colors.green,
          size: 64.0,
        ),*/
        child:const  Center(
          child: Text('\u{1F680} '),
        ),
          //Text('\u{1F680} '),
      ),
    );
  }
}
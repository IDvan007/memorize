import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String myIcon;

  const MyCard({super.key, required this.myIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 3, color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Align(
          child: Text(myIcon, style: const TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}

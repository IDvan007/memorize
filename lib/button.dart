import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String minusPlus;

  const MyButton({super.key, required this.minusPlus});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 4),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Text(
          widget.minusPlus,
          style: const TextStyle(color: Colors.blue, fontSize: 36),
        ),
        onPressed: () => {},
      ),
    );
  }
}

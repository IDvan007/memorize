import 'package:flutter/material.dart';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            color: _active ? Colors.blue : Colors.white,
            border: Border.all(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Align(
            child: Text(_active ? '' : widget.myIcon,
                style: const TextStyle(fontSize: 50)),
          ),
        ),
      ),
    );
  }
}

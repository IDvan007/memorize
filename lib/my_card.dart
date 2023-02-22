import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    this.active = false,
    required this.onChanged,
    required this.myIcon,
  });

  final bool active;
  final ValueChanged<bool> onChanged;
  final String myIcon;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            color: active ? Colors.blue : Colors.white,
            border: Border.all(width: 3, color: Colors.blue),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Align(
            child: Text(active ? '': myIcon, style: const TextStyle(fontSize: 50)),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CheckButton extends StatelessWidget {
  final IconData icon;
  const CheckButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon),
      color: Colors.black87,
      style: IconButton.styleFrom(
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        iconSize: 20,
        padding: EdgeInsets.all(0.0),
        visualDensity: VisualDensity.compact,
        alignment: Alignment.topLeft,
      ),
    );
  }
}

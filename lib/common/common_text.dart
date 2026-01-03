import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight? fontWeight;
  const CommonText({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black87,
        fontSize: size,
        letterSpacing: 1.2,
        fontWeight: fontWeight,
      ),
    );
  }
}

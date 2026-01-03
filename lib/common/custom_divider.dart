import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double? endIndent;
  final double? startIndent;
  const CustomDivider({
    super.key,
    this.endIndent,
    this.startIndent,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        endIndent: endIndent,
        indent: startIndent,
        height: 2.5,
        color: Colors.black87,
      ),
    );
  }
}

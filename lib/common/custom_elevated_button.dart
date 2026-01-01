import 'package:firebase_auth_practice/const/colors/color_pallete.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackgroundColor,
        foregroundColor: Colors.black87,
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.8,
        ),
        elevation: 15.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        fixedSize: Size(310, 50),
      ),
      child: Text(text),
    );
  }
}

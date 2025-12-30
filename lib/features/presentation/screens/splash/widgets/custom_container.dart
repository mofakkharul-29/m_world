import 'package:firebase_auth_practice/const/colors/color_pallete.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(seconds: 4),
        curve: Curves.easeOutBack,
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_open_outlined,
                size: 95.5 * value,
                color: primaryIconConlor,
              ),
              const SizedBox(height: 25.5),
              Text(
                'B E S T   T O   M A K E   C I R C L E !',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20 * value,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 143, 139, 139),
      body: Column(
        children: [
          PageView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              
            },
            ),
        ],
      ),
    );
  }
}

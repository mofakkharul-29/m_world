import 'package:flutter/material.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getOptions(
          () {},
          'assets/images/facebook.png',
          50.0,
          50.0,
        ),
        const SizedBox(width: 40),
        getOptions(
          () {},
          'assets/images/google.png',
          55.0,
          55.0,
        ),
        const SizedBox(width: 40),
        getOptions(
          () {},
          'assets/images/phone.png',
          45.0,
          45.0,
        ),
      ],
    );
  }

  Widget getOptions(
    void Function()? onTap,
    String image,
    double? height,
    double? width,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15.5),
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Image.asset(
        image,
        height: height,
        width: width,
      ),
    );
  }
}

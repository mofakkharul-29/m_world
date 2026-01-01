import 'package:flutter/material.dart';

class TextFieldController {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocus;
  final FocusNode passwordFocus;

  TextFieldController({
    required this.emailController,
    required this.passwordController,
    required this.emailFocus,
    required this.passwordFocus,
  });

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
  }

  void moveToPassword(BuildContext context) {
    FocusScope.of(context).requestFocus(passwordFocus);
  }

  void submit(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
  }
}

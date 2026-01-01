import 'package:firebase_auth_practice/features/presentation/screens/log_reg/provider/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginFieldControllerProvider =
    Provider.autoDispose<TextFieldController>((ref) {
      final controller = TextFieldController(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        emailFocus: FocusNode(),
        passwordFocus: FocusNode(),
      );
      ref.onDispose(controller.dispose);

      return controller;
    });

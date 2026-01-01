import 'package:firebase_auth_practice/common/custom_elevated_button.dart';
import 'package:firebase_auth_practice/const/colors/color_pallete.dart';
import 'package:firebase_auth_practice/features/presentation/screens/log_reg/provider/login_state_notifier.dart';
import 'package:firebase_auth_practice/features/presentation/screens/log_reg/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginStateNotifierProvider);
    final notifier = ref.read(
      loginStateNotifierProvider.notifier,
    );

    return GestureDetector(
      onTap: () =>
          FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(
              // vertical: 10.5,
              horizontal: 15,
            ),
            child: SizedBox(
              height:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    labelText: 'Email',
                    prefixIcon: Icons.email_outlined,
                    keyboardType:
                        TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    errorText: state.emailError,
                    onChange: notifier.onEmailChanged,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Password',
                    prefixIcon: Icons.lock_outlined,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    errorText: state.passwordError,
                    onChange: notifier.onPasswordChanged,
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    onPressed: () {
                      final isValid = notifier.submit();
                      if (isValid) {}
                    },
                    text: 'login',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

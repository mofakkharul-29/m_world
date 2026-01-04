import 'package:firebase_auth_practice/common/common_text.dart';
import 'package:firebase_auth_practice/common/custom_divider.dart';
import 'package:firebase_auth_practice/common/custom_elevated_button.dart';
import 'package:firebase_auth_practice/common/login_options.dart';
import 'package:firebase_auth_practice/const/colors/color_pallete.dart';
import 'package:firebase_auth_practice/features/presentation/screens/log_reg/provider/login_state_notifier.dart';
import 'package:firebase_auth_practice/features/presentation/screens/log_reg/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

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
                    labelText: 'Username',
                    prefixIcon: Icons.person_outline,
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
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    errorText: state.passwordError,
                    onChange: notifier.onPasswordChanged,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    labelText: 'Confirm Password',
                    prefixIcon: Icons.lock_outlined,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    errorText: state.passwordError,
                    onChange: notifier.onPasswordChanged,
                  ),
                  const SizedBox(height: 10),
                  CustomElevatedButton(
                    onPressed: () {},
                    text: 'SignUp',
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.end,
                    children: [
                      const CommonText(
                        text: 'Have an account?',
                        size: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      InkWell(
                        onTap: () {
                          context.go('/login');
                        },
                        child: const CommonText(
                          text: 'Sign in',
                          size: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomDivider(
                        startIndent: 0.0,
                        endIndent: 5.0,
                      ),
                      CommonText(
                        text: 'or',
                        size: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                      CustomDivider(
                        startIndent: 5.0,
                        endIndent: 0.0,
                      ),
                    ],
                  ),
                  LoginOptions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

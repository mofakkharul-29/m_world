import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_state.dart';

class LoginNotifier extends Notifier<LoginState> {
  @override
  LoginState build() {
    return LoginState();
  }

  void onEmailChanged(String value) {
    state = state.copyWith(
      email: value,
      emailError: state.isSubmitted
          ? _validateEmail(value)
          : null,
    );
  }

  void onPasswordChanged(String value) {
    state = state.copyWith(
      password: value,
      passwordError: state.isSubmitted
          ? _validatePassword(value)
          : null,
    );
  }

  bool submit() {
    final emailError = _validateEmail(state.email);
    final passwordError = _validatePassword(state.password);

    state = state.copyWith(
      isSubmitted: true,
      emailError: emailError,
      passwordError: passwordError,
    );

    return emailError == null && passwordError == null;
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) return 'Email is required';
    final regex = RegExp(
      r'^[\w\.-]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    if (!regex.hasMatch(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}

final loginStateNotifierProvider =
    NotifierProvider<LoginNotifier, LoginState>(
      LoginNotifier.new,
    );

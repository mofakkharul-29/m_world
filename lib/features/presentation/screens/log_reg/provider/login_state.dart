class LoginState {
  final bool isSubmitted;
  final String email;
  final String? emailError;
  final String password;
  final String? passwordError;

  LoginState({
    this.isSubmitted = false,
    this.email = '',
    this.emailError,
    this.password = '',
    this.passwordError,
  });

  LoginState copyWith({
    bool? isSubmitted,
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
  }) {
    return LoginState(
      isSubmitted: isSubmitted ?? this.isSubmitted,
      email: email ?? this.email,
      emailError: emailError,
      password: password ?? this.password,
      passwordError: passwordError,
    );
  }
}

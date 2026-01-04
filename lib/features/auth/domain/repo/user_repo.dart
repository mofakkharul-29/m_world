import 'package:firebase_auth_practice/features/auth/domain/models/app_user.dart';

abstract class UserRepo {
  Future<AppUser?> loginWithEmailPassword(
    String email,
    String password,
  );
  Future<AppUser?> registerWithEmailPassword(
    String email,
    String name,
    String password,
  );
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
  Future<String> sendPasswordResetEmail(String email);
  Future<void> deleteAccount();
}

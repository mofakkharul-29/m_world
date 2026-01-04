import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_practice/features/auth/domain/models/app_user.dart';
import 'package:firebase_auth_practice/features/auth/domain/repo/user_repo.dart';

class UserRepoData implements UserRepo {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<AppUser?> loginWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredintial = await auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          );
      final firebaseUser = userCredintial.user;
      if (firebaseUser == null) {
        throw Exception('User not found after login');
      }
      return AppUser(
        uid: firebaseUser.uid,
        name: firebaseUser.displayName ?? 'NewUser',
        email: firebaseUser.email!,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Login failed');
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(
    String email,
    String name,
    String password,
  ) async {
    try {
      final UserCredential credential = await auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      final newUser = credential.user;
      if (newUser == null) {
        throw Exception(
          'User not found after registration',
        );
      }
      await newUser.updateDisplayName(name);

      return AppUser(
        uid: newUser.uid,
        name: newUser.displayName!,
        email: newUser.email!,
        photo: newUser.photoURL,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Registration failed');
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        throw Exception('No user logged in..');
      }
      await currentUser.delete();
      await logout();
    } on FirebaseAuthException catch (e) {
      throw Exception(
        e.message ?? 'Failed to delete account',
      );
    }
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    try {
      final currentUser = auth.currentUser;
      if (currentUser == null) return null;
      return AppUser(
        uid: currentUser.uid,
        name: currentUser.displayName ?? 'NewUser',
        email: currentUser.email!,
        photo: currentUser.photoURL,
      );
    } catch (e) {
      throw Exception('something went wrong: $e');
    }
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }

  @override
  Future<String> sendPasswordResetEmail(
    String email,
  ) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return 'check your inbox, an email is sent';
    } catch (e) {
      return ('an error ocured: $e');
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_practice/core/startup/startup_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

class RedirectionPath extends ChangeNotifier {
  Ref ref;
  bool? _isFirstLaunch;
  bool _isLoggedIn = false;
  bool _splashCompleted = false;

  RedirectionPath(this.ref) {
    ref.listen<bool?>(startupStatus, (previous, next) {
      _isFirstLaunch = next;
      notifyListeners();
    });

    ref.listen<AsyncValue<User?>>(authStateProvider, (
      previous,
      next,
    ) {
      _isLoggedIn = next.when(
        data: (user) => user != null,
        error: (_, _) => false,
        loading: () => false,
      );
      notifyListeners();
    });
  }

  void completeSplash() {
    _splashCompleted = true;
    notifyListeners();
  }

  bool? get firstLaunch => _isFirstLaunch;
  bool get isLoggedIn => _isLoggedIn;
  bool get splashCompleted => _splashCompleted;
}

final refreshListenableProvider = Provider<RedirectionPath>(
  (ref) {
    return RedirectionPath(ref);
  },
);

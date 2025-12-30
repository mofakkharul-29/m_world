import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartupNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('isFirstLaunch') ?? true;
  }

  Future<void> completeOnboarding() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isFirstLaunch', false);
    state = const AsyncData(false);
  }
}

final startupNotifierProvider =
    AsyncNotifierProvider<StartupNotifier, bool>(
      StartupNotifier.new,
    );

final startupStatus = Provider<bool?>((ref) {
  final AsyncValue<bool> asyncStatus = ref.watch(
    startupNotifierProvider,
  );
  return asyncStatus.whenOrNull(
    data: (isFirstLaunch) => isFirstLaunch,
  );
});

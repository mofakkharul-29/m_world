import 'package:firebase_auth_practice/const/colors/color_pallete.dart';
import 'package:firebase_auth_practice/core/startup/redirection_path.dart';
import 'package:firebase_auth_practice/features/presentation/screens/splash/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      ref.read(refreshListenableProvider).completeSplash();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: const CustomContainer(),
    );
  }
}

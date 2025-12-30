import 'package:firebase_auth_practice/const/colors/color_pallete.dart';
import 'package:firebase_auth_practice/core/startup/startup_notifier.dart';
import 'package:firebase_auth_practice/features/presentation/screens/onboarding/widgets/page_builder_item.dart';
import 'package:firebase_auth_practice/features/presentation/screens/onboarding/widgets/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int idx;
    final List<Map<String, dynamic>> pages = ref.watch(
      pageProvider,
    );

    Future<void> onButtonTap() async {
      await ref
          .read(startupNotifierProvider.notifier)
          .completeOnboarding();
    }

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          idx = index;
          final currentPage = pages[index];
          return PageBuilderItem(
            currentPage: currentPage,
            idx: idx,
            onFinish: onButtonTap,
          );
        },
      ),
    );
  }
}

import 'package:firebase_auth_practice/core/routing/routing_path_name.dart';
import 'package:firebase_auth_practice/core/startup/redirection_path.dart';
import 'package:firebase_auth_practice/features/presentation/screens/home/home_screen.dart';
import 'package:firebase_auth_practice/features/presentation/screens/log_reg/login.dart';
import 'package:firebase_auth_practice/features/presentation/screens/log_reg/sign_up.dart';
import 'package:firebase_auth_practice/features/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:firebase_auth_practice/features/presentation/screens/splash/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RoutingConfig {
  static final routerProvider = Provider<GoRouter>((ref) {
    final refresh = ref.watch(refreshListenableProvider);

    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/splash',
      refreshListenable: refresh,
      redirect: (context, state) {
        final String location = state.uri.path;
        final bool? isFirstLaunch = refresh.firstLaunch;
        final bool isLoggedIn = refresh.isLoggedIn;
        const authRoutes = ['/login', '/register'];

        if (!refresh.splashCompleted) return null;

        if (isFirstLaunch == null) return '/splash';

        if (isFirstLaunch) {
          return location == '/onboarding'
              ? null
              : '/onboarding';
        }

        if (!isLoggedIn) {
          return authRoutes.contains(location)
              ? null
              : '/login';
        }

        if (isLoggedIn && authRoutes.contains(location)) {
          return '/home';
        }

        return null;
      },
      routes: [
        GoRoute(
          path: '/splash',
          name: splashScreenRoute,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/onboarding',
          name: onBoardingScreenRoute,
          builder: (context, state) =>
              const OnboardingScreen(),
        ),
        GoRoute(
          path: '/login',
          name: loginScreenRoute,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/register',
          name: registerScreenRoute,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: '/home',
          name: homeScreenRoute,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  });
}

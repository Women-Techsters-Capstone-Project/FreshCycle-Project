import 'package:freshcycle/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/role_selection_page.dart';
import '../../features/auth/presentation/pages/signup_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/home/presentation/pages/buyer_home_page.dart';
import '../../features/home/presentation/pages/farmer_home_page.dart';
import '../../features/home/presentation/pages/logistics_home_page.dart';
import '../../features/home/presentation/pages/admin_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/role-selection',
        builder: (context, state) => const RoleSelectionPage(),
      ),
      GoRoute(
  path: '/signup',
  builder: (context, state) {
    final role = state.extra as String? ?? 'buyer'; // Defaults to buyer if null
    return SignupPage(role: role);
  },
),
      GoRoute(
  path: '/login',
  builder: (context, state) => const LoginPage(),
),
      GoRoute(
        path: '/buyer-home',
        builder: (context, state) => const BuyerHomePage(),
        ),

        GoRoute(
          path: '/farmer-home',
          builder: (context, state) => const FarmerHomePage(),
        ),

        GoRoute(
          path: '/logistics-home',
          builder: (context, state) => const LogisticsHomePage(),
          ),

        GoRoute(
          path: '/admin-home',
          builder: (context, state) => const AdminHomePage(),
          ), 

    ],
  );
}
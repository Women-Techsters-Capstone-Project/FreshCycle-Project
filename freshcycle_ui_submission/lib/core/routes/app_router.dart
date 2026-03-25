import 'package:freshcycle/features/buyer/presentation/pages/cart_page.dart';
import 'package:freshcycle/features/farmer/presentation/pages/add_produce_page.dart';
import 'package:freshcycle/features/farmer/presentation/pages/farmer_profile_page.dart';
import 'package:freshcycle/features/farmer/presentation/pages/manage_invetory_page.dart';
import 'package:freshcycle/features/farmer/presentation/pages/reports_page.dart';
import 'package:freshcycle/features/farmer/presentation/pages/track_delivery_page.dart';
import 'package:freshcycle/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';
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
          path: '/cart',
          builder: (context, state) => const CartPage(),
        ),

      GoRoute(
        path: '/farmer-home',
        builder: (context, state) => const FarmerHomePage(),
        routes: [
          // These are the "Child" routes
          GoRoute(
            path: 'add-produce', // Final path: /farmer-home/add-produce
            builder: (context, state) => const AddProducePage(), 
          ),
          GoRoute(
            path: 'track-delivery', // Final path: /farmer-home/track-delivery
            builder: (context, state) => const TrackDeliveryPage(),
          ),
          GoRoute(
            path: 'reports', // Final path: /farmer-home/reports
            builder: (context, state) => const ReportsPage(),
          ),
          GoRoute(
            path: 'profile', // Final path: /farmer-home/profile
            builder: (context, state) => const FarmerProfilePage(),
          ),
          GoRoute(
            path: 'manage-inventory', // Final path: /farmer-home/manage-inventory
            builder: (context, state) => const ManageInventoryPage(),
          ),
        ],
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
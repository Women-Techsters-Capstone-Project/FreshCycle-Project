import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    // 3-second delay, then move to onboarding
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.go('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface, // Clean white background
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // The Green Leaf Logo
            const Icon(
              Icons.energy_savings_leaf_outlined, // Matches your leaf design
              color: AppColors.primary,
              size: 48,
            ),
            const SizedBox(width: 8),
            // FreshCycle Text
            Text(
              'FreshCycle',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryDark, // Dark green from your palette
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
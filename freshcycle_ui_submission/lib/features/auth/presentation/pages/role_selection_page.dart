import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Text(
                "Select Your Role",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 32,
                  color: AppColors.primaryDark,
                ),
              ),
              const SizedBox(height: 48),
              
              // Role Cards
              _RoleCard(
                title: "Farmer / Seller",
                description: "Sell your produce and manage your harvest.",
                icon: Icons.agriculture_rounded,
                onTap: () => context.push('/signup', extra: 'farmer'),
              ),
              const SizedBox(height: 16),
              _RoleCard(
                title: "Buyer / Retailer",
                description: "Purchase fresh produce directly from the source.",
                icon: Icons.shopping_bag_rounded,
                onTap: () => context.push('/signup', extra: 'buyer'),
              ),
              const SizedBox(height: 16),
              _RoleCard(
                title: "Logistics Provider",
                description: "Help move produce from farm to market.",
                icon: Icons.local_shipping_rounded,
                onTap: () => context.push('/signup', extra: 'logistics'),
              ),
              const SizedBox(height: 16),

              _RoleCard(
                  title: "Admin",
                  description: "Manage users, orders, and system settings.",
                  icon: Icons.admin_panel_settings_rounded,
                  onTap: () => context.push('/signup', extra: 'admin'),
                ),
                
                const SizedBox(height: 30),

                // Login redirect for existing users
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () => context.push('/login'),
                      child: const Text(
                        "Login", 
                        style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );

  }
}

          
      

class _RoleCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primarySoft.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary, size: 30),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.disabled),
          ],
        ),
      ),
    );
  }
}
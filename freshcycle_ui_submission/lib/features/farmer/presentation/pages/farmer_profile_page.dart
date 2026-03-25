import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class FarmerProfilePage extends StatelessWidget {
  const FarmerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Header
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primarySoft,
              child: Icon(Icons.person, size: 50, color: AppColors.primary),
            ),
            const SizedBox(height: 16),
            const Text("Farmer John Doe", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text("Ogun State, Nigeria", style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 32),

            // Settings List
            _buildProfileOption(Icons.location_on_outlined, "Farm Location"),
            _buildProfileOption(Icons.account_balance_wallet_outlined, "Payout Settings"),
            _buildProfileOption(Icons.verified_user_outlined, "Verification Status"),
            _buildProfileOption(Icons.help_outline, "Support Helpdesk"),
            const Divider(height: 40),
            _buildProfileOption(Icons.logout, "Logout", isDestructive: true),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : AppColors.primary),
      title: Text(title, style: TextStyle(color: isDestructive ? Colors.red : AppColors.textPrimary)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
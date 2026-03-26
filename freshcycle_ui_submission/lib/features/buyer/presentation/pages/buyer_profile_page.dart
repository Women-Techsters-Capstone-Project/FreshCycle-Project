import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class BuyerProfilePage extends StatelessWidget {
  const BuyerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 16),
            const Text("Panashe Buyer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 32),
            _buildTile(Icons.location_on_outlined, "Shipping Addresses"),
            _buildTile(Icons.payment_outlined, "Payment Methods"),
            _buildTile(Icons.history, "Purchase History"),
            _buildTile(Icons.logout, "Logout", isRed: true),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(IconData icon, String title, {bool isRed = false}) {
    return ListTile(
      leading: Icon(icon, color: isRed ? Colors.red : AppColors.primary),
      title: Text(title, style: TextStyle(color: isRed ? Colors.red : Colors.black)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
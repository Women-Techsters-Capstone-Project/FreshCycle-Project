import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("System Admin")),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        children: [
          _adminCard("Verify Sellers", Icons.verified_user, Colors.blue),
          _adminCard("Manage Orders", Icons.shopping_cart, Colors.orange),
          _adminCard("Logistics Map", Icons.map, Colors.green),
          _adminCard("System Health", Icons.analytics, Colors.purple),
        ],
      ),
    );
  }

  Widget _adminCard(String title, IconData icon, Color color) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 40),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
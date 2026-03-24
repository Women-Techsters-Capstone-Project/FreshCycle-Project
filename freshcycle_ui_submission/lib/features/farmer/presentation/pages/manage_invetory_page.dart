import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ManageInventoryPage extends StatelessWidget {
  const ManageInventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Inventory"),
        actions: [IconButton(icon: const Icon(Icons.filter_list), onPressed: () {})],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5, // Replace with real data count later
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.eco, color: AppColors.primary),
              title: const Text("Premium Cassava"),
              subtitle: const Text("50 Sacks remaining"),
              trailing: const Icon(Icons.edit_outlined, size: 20),
              onTap: () {
                // Future: Edit item logic
              },
            ),
          );
        },
      ),
    );
  }
}

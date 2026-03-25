import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/empty_state_widget.dart';

class BuyerOrdersPage extends StatelessWidget {
  const BuyerOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // For now, we use a placeholder count. 
    // In the future, if this is 0, we show the EmptyStateWidget.
    int orderCount = 3; 

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("My Orders", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryDark,
        elevation: 0,
      ),
      body: orderCount == 0 
        ? const EmptyStateWidget(
            title: "No Orders Yet",
            description: "Your active and past orders will appear here. Start shopping to see them!",
            icon: Icons.receipt_long_outlined,
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: orderCount,
            itemBuilder: (context, index) => _buildOrderCard(context),
          ),
    );
  }

  Widget _buildOrderCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primarySoft.withValues(alpha:0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.local_mall_outlined, color: AppColors.primary),
        ),
        title: const Text(
          "Order #FC-9921", 
          style: TextStyle(fontWeight: FontWeight.bold)
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.circle, size: 8, color: Colors.blue),
                const SizedBox(width: 6),
                Text(
                  "In Transit • ₦12,500", 
                  style: TextStyle(color: Colors.blue.shade700, fontSize: 13, fontWeight: FontWeight.w500)
                ),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: AppColors.textSecondary),
        onTap: () {
          // Future: Navigate to Order Detail Page
        },
      ),
    );
  }
}
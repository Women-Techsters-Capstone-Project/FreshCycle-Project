import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class TrackDeliveryPage extends StatelessWidget {
  const TrackDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Delivery Tracking")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Active Shipments", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildTrackingCard("Order #4421", "In Transit", "Expected: Today", Icons.local_shipping),
          const SizedBox(height: 12),
          _buildTrackingCard("Order #4390", "Picked Up", "Expected: Tomorrow", Icons.inventory),
        ],
      ),
    );
  }

  Widget _buildTrackingCard(String orderId, String status, String time, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.blue.withValues(alpha:0.1), shape: BoxShape.circle),
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(orderId, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(status, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Text(time, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
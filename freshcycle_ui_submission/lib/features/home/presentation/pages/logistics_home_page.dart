import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class LogisticsHomePage extends StatelessWidget {
  const LogisticsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Logistics Dashboard"),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryDark,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.map_outlined, color: AppColors.primary)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Toggle (Available/Busy)
            _buildStatusToggle(),
            const SizedBox(height: 24),

            // Performance Stats
            const Text("Today's Overview", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildSimpleStat("Completed", "8", Colors.green),
                const SizedBox(width: 12),
                _buildSimpleStat("Pending", "3", Colors.orange),
                const SizedBox(width: 12),
                _buildSimpleStat("Earnings", "₦12.5k", AppColors.primary),
              ],
            ),
            const SizedBox(height: 30),

            // Active Shipments Section
            const Text("Assigned Shipments", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildDeliveryCard(
              context,
              orderId: "#FC-9921",
              pickup: "Green Valley Farm, Jos",
              dropoff: "Central Market, Abuja",
              status: "In Transit",
              type: "Perishables",
            ),
            _buildDeliveryCard(
              context,
              orderId: "#FC-8842",
              pickup: "Zaki Biam Yam Market",
              dropoff: "Lagos Port Complex",
              status: "Ready for Pickup",
              type: "Bulk Grains",
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusToggle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Current Status", style: TextStyle(fontSize: 12, color: AppColors.primary)),
              Text("Available for Orders", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          Switch(value: true, onChanged: (v) {}, activeColor: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildSimpleStat(String label, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: AppColors.border)),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
            Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryCard(BuildContext context, {required String orderId, required String pickup, required String dropoff, required String status, required String type}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.border)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(orderId, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: AppColors.primarySoft.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                child: Text(type, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.primaryDark)),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              Column(
                children: [
                 const Icon(Icons.circle, size: 12, color: AppColors.primary),
                  Container(width: 2, height: 30, color: AppColors.border),
                 const Icon(Icons.location_on, size: 14, color: Colors.red),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pickup, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 18),
                    Text(dropoff, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: Text(status == "In Transit" ? "View Map" : "Accept Pickup", style: const TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
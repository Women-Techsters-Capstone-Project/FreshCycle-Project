import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';

class FarmerHomePage extends StatefulWidget {
  const FarmerHomePage({super.key});

  @override
  State<FarmerHomePage> createState() => _FarmerHomePageState();
}

class _FarmerHomePageState extends State<FarmerHomePage> {
  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final now = DateTime.now();
        final maxDuration = const Duration(seconds: 2);
        final isWarning = lastPressed == null || now.difference(lastPressed!) > maxDuration;

        if (isWarning) {
          lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Press back again to exit FreshCycle'),
              backgroundColor: AppColors.primaryDark,
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text("Farmer Dashboard", style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          foregroundColor: AppColors.primaryDark,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => context.push('/farmer-home/profile'), 
              icon: const Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Text
              const Text("Hello, Farmer Panashe!", style: TextStyle(color: AppColors.textSecondary, fontSize: 16)),
              const SizedBox(height: 8),
              const Text("Your Farm Overview", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 24),

              // Stats Row
              Row(
                children: [
                  _buildStatCard("Total Sales", "₦450,000", Icons.payments_outlined, AppColors.primary),
                  const SizedBox(width: 16),
                  _buildStatCard("Active Items", "12 Items", Icons.inventory_2_outlined, AppColors.accent),
                ],
              ),
              const SizedBox(height: 30),

              // Quick Actions
              const Text("Quick Actions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionButton(
                    context,
                    "Add Produce",
                    Icons.add_a_photo_outlined,
                    AppColors.primary,
                    '/farmer-home/add-produce',
                  ),
                  _buildActionButton(
                    context,
                    "Track Delivery",
                    Icons.local_shipping_outlined,
                    Colors.blue,
                    '/farmer-home/track-delivery',
                  ),
                  _buildActionButton(
                    context,
                    "View Reports",
                    Icons.bar_chart_outlined,
                    Colors.purple,
                    '/farmer-home/reports',
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Recent Listings Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Your Recent Listings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () => context.push('/farmer-home/manage-inventory'), 
                    child: const Text("Manage All"),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _buildListingItem("Sweet Potatoes", "24 Sacks", "₦5,000 / sack", "Pending"),
              _buildListingItem("Yellow Corn", "100 KG", "₦1,200 / KG", "Active"),
              _buildListingItem("Fresh Carrots", "15 Baskets", "₦3,500 / basket", "Sold Out"),

              const SizedBox(height: 40),
            ],
          ),
        ),
        // Floating Action Button
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.push('/farmer-home/add-produce'),
          backgroundColor: AppColors.primary,
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text("List New Produce", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  // --- HELPER FUNCTIONS ---

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(title, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String label, IconData icon, Color color, String route) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildListingItem(String name, String qty, String price, String status) {
    Color statusColor = status == "Active" ? Colors.green : (status == "Pending" ? Colors.orange : Colors.red);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.primarySoft.withValues(alpha:0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.eco, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("$qty • $price", style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class BuyerExplorePage extends StatelessWidget {
  const BuyerExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Explore FreshCycle", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: AppColors.primary),
            onPressed: () {
              context.push('/cart');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Deliver To Section
            _buildDeliveryHeader(context),
            const SizedBox(height: 24),

            // 2. Categories Section
            const Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildCategoryGrid(),

            const SizedBox(height: 30),

            // 3. Featured Produce
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Freshly Harvested", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text("View All")),
              ],
            ),
            const SizedBox(height: 12),
            _buildFeaturedList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryHeader(BuildContext context) {
    return GestureDetector(
      onTap: () => _showCountryPicker(context),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primarySoft.withValues(alpha:0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          children: [
            Icon(Icons.location_on, color: AppColors.primary),
            SizedBox(width: 8),
            Text("Deliver to: ", style: TextStyle(color: AppColors.textSecondary)),
            Text("Nigeria", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
            Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    final categories = [
      {'name': 'Vegetables', 'icon': Icons.eco_outlined},
      {'name': 'Fruits', 'icon': Icons.apple_outlined},
      {'name': 'Grains', 'icon': Icons.bakery_dining_outlined},
      {'name': 'Tubers', 'icon': Icons.grass_outlined},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(categories[index]['icon'] as IconData, color: AppColors.primary),
            ),
            const SizedBox(height: 4),
            Text(categories[index]['name'] as String, style: const TextStyle(fontSize: 10)),
          ],
        );
      },
    );
  }

  Widget _buildFeaturedList() {
    // This would be replaced by your actual produce cards later
    return const Column(
      children: [
        ListTile(
          leading: Icon(Icons.shopping_basket_outlined, color: Colors.orange),
          title: Text("Organic Tomatoes"),
          subtitle: Text("₦4,500 per basket"),
          trailing: Icon(Icons.add_circle_outline, color: AppColors.primary),
        ),
      ],
    );
  }

  void _showCountryPicker(BuildContext context) {
    final countries = ['Nigeria', 'Kenya', 'Zimbabwe', 'Ghana', 'South Africa', 'Rwanda'];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Select Country", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ...countries.map((c) => ListTile(
              title: Text(c),
              onTap: () => Navigator.pop(context),
            )),
          ],
        ),
      ),
    );
  }
}
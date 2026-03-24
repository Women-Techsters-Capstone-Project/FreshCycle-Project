import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/empty_state_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Shopping Cart", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryDark,
        elevation: 0,
      ),
      body: Column(
        children: [
          // The professional Empty State replaces the simple Text widget
          const Expanded(
            child: EmptyStateWidget(
              title: "Your Cart is Empty",
              description: "Looks like you haven't added any fresh produce yet. Start exploring the marketplace to support local farmers!",
              icon: Icons.shopping_basket_outlined,
            ),
          ),
          
          // Checkout Section
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                // Optional: Total Price Row (set to 0 for empty state)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Amount", style: TextStyle(fontSize: 16, color: AppColors.textSecondary)),
                    Text("₦0.00", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: null, // Disabled because cart is empty
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor: AppColors.border, // Looks grey when empty
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      "Checkout", 
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
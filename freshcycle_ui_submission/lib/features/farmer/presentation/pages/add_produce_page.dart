import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class AddProducePage extends StatefulWidget {
  const AddProducePage({super.key});

  @override
  State<AddProducePage> createState() => _AddProducePageState();
}

class _AddProducePageState extends State<AddProducePage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  final List<String> _categories = ['Vegetables', 'Fruits', 'Grains', 'Tubers'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("List New Produce"),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryDark,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Produce Details", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              
              // 1. Produce Name
              _buildTextField("Produce Name", "e.g. Red Onions", Icons.eco_outlined),
              const SizedBox(height: 16),

              // 2. Category Dropdown
              DropdownButtonFormField<String>(
                decoration: _inputDecoration("Category", Icons.category_outlined),
                initialValue: _selectedCategory,
                items: _categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                onChanged: (val) => setState(() => _selectedCategory = val),
              ),
              const SizedBox(height: 16),

              // 3. Price and Quantity Row
              Row(
                children: [
                  Expanded(child: _buildTextField("Price (₦)", "500", Icons.payments_outlined, isNumber: true)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField("Quantity", "10", Icons.inventory_2_outlined, isNumber: true)),
                ],
              ),
              const SizedBox(height: 32),

              // 4. Submit Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // We will add logic to save this later!
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Produce listed successfully!')),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("List Produce", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper for consistent TextFields
  Widget _buildTextField(String label, String hint, IconData icon, {bool isNumber = false}) {
    return TextFormField(
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: _inputDecoration(label, icon).copyWith(hintText: hint),
      validator: (value) => value!.isEmpty ? 'Field required' : null,
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: AppColors.primary),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
    );
  }
}
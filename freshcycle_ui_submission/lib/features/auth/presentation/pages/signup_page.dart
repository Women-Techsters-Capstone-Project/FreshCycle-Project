import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/route_utils.dart';

class SignupPage extends StatefulWidget {
  final String role; // Pass the role from Role Selection
  const SignupPage({super.key, required this.role});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscurePassword = true;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centered text
          children: [
            const Icon(Icons.energy_savings_leaf_outlined, size: 48, color: AppColors.primary),
            const SizedBox(height: 20),
            Text(
              "Create Account",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
            ),
            Text("Signing up as ${widget.role.toUpperCase()}", 
                style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            
            // Text Fields
            _buildTextField(label: "Full Name", hint: "John Doe", icon: Icons.person_outline),
            const SizedBox(height: 16),
            _buildTextField(label: "Email Address", hint: "example@freshcycle.com", icon: Icons.email_outlined),
            const SizedBox(height: 16),
            _buildTextField(
              label: "Password", 
              hint: "••••••••", 
              icon: Icons.lock_outline,
              isPassword: true,
              suffix: IconButton(
                icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
            
            const SizedBox(height: 20),
            // Terms Checkbox
            Row(
              children: [
                Checkbox(
                  value: _acceptTerms,
                  activeColor: AppColors.primary,
                  onChanged: (val) => setState(() => _acceptTerms = val!),
                ),
                const Expanded(
                  child: Text("I agree to the Terms of Service and Privacy Policy"),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            // Sign Up Button
          ElevatedButton(
   style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    minimumSize: const Size(double.infinity, 56),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  onPressed: () {
    // 1. We wrap it in an anonymous function () {}
    // 2. We use 'widget.role' to access the role from the top class
    RouteUtils.navigateByRole(context, widget.role);
  },
  child: const Text(
    "Sign Up", 
    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
  ),
)
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String hint, required IconData icon, bool isPassword = false, Widget? suffix}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword && _obscurePassword,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: AppColors.primary),
            suffixIcon: suffix,
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
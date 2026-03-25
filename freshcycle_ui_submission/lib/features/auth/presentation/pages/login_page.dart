import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/route_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Brand Logo
                const Icon(Icons.energy_savings_leaf_outlined, size: 60, color: AppColors.primary),
                const SizedBox(height: 16),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 28),
                ),
                const Text("Login to manage your FreshCycle account", 
                    style: TextStyle(color: AppColors.textSecondary)),
                const SizedBox(height: 40),
                
                // Email Field
                _buildInput(label: "Email", hint: "example@mail.com", icon: Icons.email_outlined),
                const SizedBox(height: 16),
                
                // Password Field
                _buildInput(
                  label: "Password", 
                  hint: "••••••••", 
                  icon: Icons.lock_outline,
                  isPassword: true,
                  suffix: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                
                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password?", style: TextStyle(color: AppColors.primary)),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Login Button
                ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    minimumSize: const Size(double.infinity, 56),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  onPressed: () {
    // For now, we manually set this to 'buyer' to test the buyer dashboard.
    // You can change this to 'farmer' or 'logistics' to test other routes!
    const String loggedInUserRole = "buyer"; 
    
    debugPrint("Logging in as: $loggedInUserRole");
    RouteUtils.navigateByRole(context, loggedInUserRole);
  },
  child: const Text(
    "Login", 
    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
  ),
),
                
                const SizedBox(height: 24),
                
                // Bottom Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () => context.push('/role-selection'),
                      child: const Text("Sign Up", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput({required String label, required String hint, required IconData icon, bool isPassword = false, Widget? suffix}) {
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
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouteUtils {
  static void navigateByRole(BuildContext context, String role) {
    switch (role.toLowerCase()) {
      case 'farmer':
        context.go('/farmer-home');
        break;
      case 'buyer':
        context.go('/buyer-home');
        break;
      case 'logistics':
        context.go('/logistics-home');
        break;
      case 'admin':
        context.go('/admin-home'); // We can add this placeholder next
        break;
      default:
        context.go('/buyer-home');
    }
  }
}
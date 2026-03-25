import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Sell & Aggregate',
      'desc': 'Join a community of farmers and bulk sellers to reach larger markets.',
      'image': 'assets/images/sell.jpg', // Fresh vegetables
    },
    {
      'title': 'Access Buyers Directly',
      'desc': 'Connect with retailers and consumers without middle-men markups',
      'image': 'assets/images/buy.jpg', // store
    },
    {
      'title': 'Track & Preserve',
      'desc': 'Monitor your logistics and reduce post-harvest losses in real-time.',
      'image': 'assets/images/track.jpg', // Tractor/Field
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => context.go('/role-selection'),
            child: const Text('Skip', style: TextStyle(color: AppColors.textSecondary)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image Container replacing the Icon
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primarySoft.withValues(alpha:0.1),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            _pages[index]['image']!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(
                              Icons.broken_image_outlined,
                              size: 50,
                              color: AppColors.disabled,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        _pages[index]['title']!,
                        style: const TextStyle(
                          fontSize: 28, 
                          fontWeight: FontWeight.bold, 
                          color: AppColors.primaryDark,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _pages[index]['desc']!,
                        style: const TextStyle(
                          fontSize: 16, 
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          
          // Pagination Dots & Button
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 8),
                      height: 8,
                      width: _currentIndex == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == index ? AppColors.primary : AppColors.disabled,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: AppColors.primary,
                  onPressed: () {
                    if (_currentIndex < _pages.length - 1) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300), 
                        curve: Curves.easeInOut,
                      );
                    } else {
                      context.go('/role-selection');
                    }
                  },
                  child: Icon(
                    _currentIndex == _pages.length - 1 ? Icons.check : Icons.arrow_forward_ios, 
                    color: Colors.white,
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
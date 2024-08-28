import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:flutter/material.dart';

import '../../../authentication/presentation/pages/sign_up_screen.dart';
import '../widgets/page_content_widget.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    return List<Widget>.generate(3, (index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        height: 8.0,
        width: 8.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: _currentPage == index ? Colors.blue : Colors.grey,
        ),
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _onArrowPressed() {
    if (_currentPage < 2) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              BuildPageContent(
                  context: context,
                  imagePath: 'assets/images/onboarding1.jpg',
                  text: ' Stay Informed, Stay on Top',
                  subText:
                      'Get real-time notifications for class cancellations, schedule changes, and important announcements.',
                  color: ExtraColors.white),
              BuildPageContent(
                  context: context,
                  imagePath: 'assets/images/onboarding2.jpg',
                  text: 'Organize & Conquer',
                  subText:
                      'Access class materials, notes and slides all in one place.Build your personalized timetable for a stress-free semester.',
                  color: ExtraColors.onboarding2),
              BuildPageContent(
                  context: context,
                  imagePath: 'assets/images/onboarding3.jpg',
                  text: 'Find Your Way, Fast',
                  subText:
                      'Never get lost again. See your class locations on a map and get guided navigation with your phone',
                  color: ExtraColors.onboarding3),
            ],
          ),
          Positioned(
            bottom: 30.0,
            left: 20.0,
            child: Row(
              children: _buildPageIndicator(),
            ),
          ),
          Positioned(
            bottom: 30.0,
            right: 20.0,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward,
              ),
              onPressed: _onArrowPressed,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:flutter/material.dart';

import '../../../authentication/presentation/pages/sign_up_screen.dart';

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
        margin: EdgeInsets.symmetric(horizontal: 2.0),
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
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()),
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
              _buildPageContent(
                  'assets/images/onboarding1.jpg',
                  'Get Notified, Stay Up To Date',
                  'lorem ipsum',
                  ExtraColors.white),
              _buildPageContent(
                  'assets/images/onboarding2.jpg',
                  'All Your Slides In One Place',
                  'lorem ipsum',
                  ExtraColors.onboarding2),
              _buildPageContent(
                  'assets/images/onboarding3.jpg',
                  'Right Place At The Right Time',
                  'lorem ipsum',
                  ExtraColors.onboarding3),
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
              icon: Icon(
                Icons.arrow_forward,
              ),
              onPressed: _onArrowPressed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageContent(
      String imagePath, String text, String subText, Color color) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 20, top: 60),
      decoration: BoxDecoration(color: color),
      child: Column(
        children: [
          SizedBox(height: 20.0),
          Text(
            text,
            style:
                textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Image.asset(imagePath),
          Text(
            text,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

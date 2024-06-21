import 'package:campus_iq/features/home_screen.dart';
import 'package:campus_iq/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/presentation/pages/forgot_password_screen.dart';
import '../../features/authentication/presentation/pages/otp_screen.dart';
import '../../features/authentication/presentation/pages/sign_in_screen.dart';
import '../../features/authentication/presentation/pages/sign_up_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      SignUpScreen.routeName: (context) => SignUpScreen(),
      SignInScreen.routeName: (context) => SignInScreen(),
      OTPScreen.routeName: (context) => OTPScreen(),
      ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
      OnboardingScreen.routeName: (context) => const OnboardingScreen(),
      HomeScreen.routeName: (context) => HomeScreen()
    };
  }
}

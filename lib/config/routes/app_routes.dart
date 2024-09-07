import 'package:campus_iq/features/home/presentation/pages/home_screen.dart';
import 'package:campus_iq/features/home/presentation/pages/notification_screen.dart';
import 'package:campus_iq/features/home/presentation/pages/profile_screen.dart';
import 'package:campus_iq/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:campus_iq/features/upload_docs/presentation/pages/upload_screen.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/presentation/pages/forgot_password_screen.dart';
import '../../features/authentication/presentation/pages/otp_screen.dart';
import '../../features/authentication/presentation/pages/sign_in_screen.dart';
import '../../features/authentication/presentation/pages/sign_up_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      SignUpScreen.routeName: (context) => const SignUpScreen(),
      SignInScreen.routeName: (context) => const SignInScreen(),
      OTPScreen.routeName: (context) => const OTPScreen(),
      ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
      OnboardingScreen.routeName: (context) => const OnboardingScreen(),
      HomeScreen.routeName: (context) => const HomeScreen(),
      UploadScanScreen.routeName: (conext) => const UploadScanScreen(),
      NotificationScreen.routeName: (context) => const NotificationScreen(),
      ProfileScreen.routeName: (context) => const ProfileScreen(),
    };
  }
}

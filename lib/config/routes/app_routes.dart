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
      ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
    };
  }
}

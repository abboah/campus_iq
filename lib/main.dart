import 'package:campus_iq/config/routes/app_routes.dart';
import 'package:campus_iq/core/themes/theme.dart';
import 'package:campus_iq/features/authentication/presentation/pages/sign_in_screen.dart';
import 'package:campus_iq/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.getRoutes(),
    );
  }
}

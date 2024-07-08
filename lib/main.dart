import 'package:campus_iq/config/routes/app_routes.dart';
import 'package:campus_iq/core/themes/theme.dart';
import 'package:campus_iq/features/authentication/domain/usecases/signup.dart';
import 'package:campus_iq/features/authentication/presentation/pages/sign_in_screen.dart';
import 'package:campus_iq/features/authentication/presentation/pages/sign_up_screen.dart';
import 'package:campus_iq/features/home_screen.dart';
import 'package:campus_iq/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.getRoutes(),
    );
  }
}

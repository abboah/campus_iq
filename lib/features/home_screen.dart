import 'package:campus_iq/core/errors/usecases/no_params.dart';
import 'package:campus_iq/core/errors/usecases/use_case_provider.dart';
import 'package:campus_iq/features/authentication/presentation/pages/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logout = ref.watch(logoutUseCaseProvider);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              // Navigator.pushNamed(context, OTPScreen.routeName);
              try {
                final message = await logout(NoParams());
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logout Successful')));
                Navigator.pushNamed(context, SignInScreen.routeName);
              } catch (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${error.toString()}')));
                print(Text('Error: ${error.toString()}'));
                // Handle error
              }
            },
            child: const Text("logout")),
      ),
    );
  }
}

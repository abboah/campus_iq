import 'package:campus_iq/features/authentication/presentation/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/themes/extra_colors.dart';
import '../../../home_screen.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';
import '../widgets/google_auth_button.dart';
import 'otp_screen.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends ConsumerWidget {
  static const routeName = 'sign_up';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signup = ref.watch(signupProvider);
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Create",
              style:
                  textTheme.displayMedium!.copyWith(color: ExtraColors.black),
            ),
            Text(
              "Account",
              style:
                  textTheme.displayMedium!.copyWith(color: ExtraColors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            AuthTextField(
              label: 'Name',
              textTheme: textTheme,
              controller: nameController,
              obscuretext: false,
            ),
            AuthTextField(
              label: 'Email',
              textTheme: textTheme,
              controller: emailController,
              obscuretext: false,
            ),
            AuthTextField(
              label: 'Password',
              textTheme: textTheme,
              controller: passwordController,
              obscuretext: true,
            ),
            AuthButton(
                textTheme: textTheme,
                onPressed: () async {
                  // Navigator.pushNamed(context, OTPScreen.routeName);
                  try {
                    final message = await signup(nameController.text,
                        emailController.text, passwordController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sign Up successful')));
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${error.toString()}')));
                    // Handle error
                  }
                },
                textColor: ExtraColors.white,
                text: 'Sign Up'),
            Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: ExtraColors.black.withOpacity(0.5),
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    'or',
                    style: textTheme.bodyMedium!
                        .copyWith(color: ExtraColors.black),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: ExtraColors.black.withOpacity(0.5),
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
            GoogleAuthButton(
                textTheme: textTheme,
                onPressed: () {},
                backgroundColor: ExtraColors.black.withOpacity(0.1),
                textColor: ExtraColors.black,
                text: 'Continue with Google'),
            const SizedBox(
              height: 60,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.routeName);
              },
              child: Text(
                'Sign In',
                style: textTheme.bodyLarge!.copyWith(color: ExtraColors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

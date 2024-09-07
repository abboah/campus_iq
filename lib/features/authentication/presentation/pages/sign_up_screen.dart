import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/themes/extra_colors.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../providers/auth_providers.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';
import '../widgets/google_auth_button.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeName = 'sign_up';

  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  void signUp() async {
    setState(() {
      isLoading = true;
    });

    try {
      final signUp = ref.watch(signupProvider);
      await signUp(
          nameController.text, emailController.text, passwordController.text);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Sign up successful!')));
      Navigator.pushNamed(context, SignInScreen.routeName);
      // Navigate to another screen if needed
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: ${error.toString()}')));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
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
                onPressed: signUp,
                textColor: ExtraColors.white,
                isLoading: isLoading,
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

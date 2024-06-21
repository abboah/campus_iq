import 'package:campus_iq/features/authentication/presentation/providers/auth_providers.dart';
import 'package:campus_iq/features/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/themes/extra_colors.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';
import '../widgets/google_auth_button.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends ConsumerWidget {
  static const routeName = 'sign_in';
  final TextEditingController userNameOrEmailController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(loginProvider);
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.srgbToLinearGamma(),
            image: AssetImage('assets/images/compass.jpg'),
            fit: BoxFit.fitHeight),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ExtraColors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: ExtraColors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Welcome",
                style:
                    textTheme.displayMedium!.copyWith(color: ExtraColors.black),
              ),
              Text(
                "Back",
                style:
                    textTheme.displayMedium!.copyWith(color: ExtraColors.black),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthTextField(
                label: 'Email',
                textTheme: textTheme,
                controller: userNameOrEmailController,
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
                    try {
                      final user = await login(userNameOrEmailController.text,
                          passwordController.text);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Login successful: ${user.userName}')));
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Error: ${error.toString()}')));
                      // Handle error
                    }
                  },
                  textColor: ExtraColors.white,
                  text: 'Sign In'),
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
                  text: 'Sign In with Google'),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                    child: Text(
                      'Sign Up',
                      style: textTheme.bodyLarge!
                          .copyWith(color: ExtraColors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ForgotPasswordScreen.routeName);
                    },
                    child: Text(
                      'Forgot Password',
                      style: textTheme.bodyLarge!
                          .copyWith(color: ExtraColors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

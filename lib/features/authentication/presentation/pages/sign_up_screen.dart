import 'package:flutter/material.dart';

import '../../../../core/themes/extra_colors.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';
import '../widgets/google_auth_button.dart';
import 'otp_screen.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = 'sign_up';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
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
                    textTheme.displayMedium!.copyWith(color: ExtraColors.white),
              ),
              Text(
                "Account",
                style:
                    textTheme.displayMedium!.copyWith(color: ExtraColors.white),
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
              AuthTextField(
                label: 'Confirm Password',
                textTheme: textTheme,
                controller: confirmPasswordController,
                obscuretext: true,
              ),
              AuthButton(
                  textTheme: textTheme,
                  onPressed: () {
                    Navigator.pushNamed(context, OTPScreen.routeName);
                  },
                  backgroundColor: ExtraColors.blue,
                  textColor: ExtraColors.white,
                  text: 'Sign Up'),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: ExtraColors.white.withOpacity(0.5),
                      thickness: 1.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      'or',
                      style: textTheme.bodyMedium!
                          .copyWith(color: ExtraColors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: ExtraColors.white.withOpacity(0.5),
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              GoogleAuthButton(
                  textTheme: textTheme,
                  onPressed: () {},
                  backgroundColor: ExtraColors.white.withOpacity(0.1),
                  textColor: ExtraColors.white,
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
                  style:
                      textTheme.bodyLarge!.copyWith(color: ExtraColors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

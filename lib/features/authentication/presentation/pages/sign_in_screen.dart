import 'package:flutter/material.dart';

import '../../../../core/themes/extra_colors.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';
import '../widgets/google_auth_button.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = 'sign_in';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
            color: ExtraColors.white,
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
                    textTheme.displayMedium!.copyWith(color: ExtraColors.white),
              ),
              Text(
                "Back",
                style:
                    textTheme.displayMedium!.copyWith(color: ExtraColors.white),
              ),
              const SizedBox(
                height: 30,
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
                  onPressed: () {},
                  backgroundColor: ExtraColors.blue,
                  textColor: ExtraColors.white,
                  text: 'Sign In'),
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
                          .copyWith(color: ExtraColors.white),
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
                          .copyWith(color: ExtraColors.white),
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

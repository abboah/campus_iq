import 'package:flutter/material.dart';

import '../../../../core/themes/extra_colors.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = "/forgot password";
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextEditingController emailController = TextEditingController();
    Size size = MediaQuery.of(context).size;
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              Text(
                "Recover",
                style:
                    textTheme.displayMedium!.copyWith(color: ExtraColors.white),
              ),
              Text(
                "Account",
                style:
                    textTheme.displayMedium!.copyWith(color: ExtraColors.white),
              ),
              Text(
                "Enter your account's email address so recieve a password reset link.",
                style: textTheme.bodyLarge?.copyWith(color: ExtraColors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthTextField(
                  textTheme: textTheme,
                  controller: emailController,
                  label: 'Email',
                  obscuretext: false),
              AuthButton(
                  textTheme: textTheme,
                  onPressed: () {},
                  backgroundColor: ExtraColors.blue,
                  textColor: ExtraColors.white,
                  text: 'Continue'),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

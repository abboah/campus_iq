import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/themes/extra_colors.dart';
import '../providers/auth_providers.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_textfield.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  static const routeName = "/forgot password";
  TextEditingController emailController = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resetPassword = ref.watch(resetPasswordProvider);
    TextTheme textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;
    return
        // Container(
        //   height: size.height,
        //   width: size.width,
        //   decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         colorFilter: ColorFilter.srgbToLinearGamma(),
        //         image: AssetImage('assets/images/compass.jpg'),
        //         fit: BoxFit.fitHeight),
        //   ),
        //   child:
        Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 60,
            ),
            Text(
              "Recover",
              style:
                  textTheme.displayMedium!.copyWith(color: ExtraColors.black),
            ),
            Text(
              "Account",
              style:
                  textTheme.displayMedium!.copyWith(color: ExtraColors.black),
            ),
            Text(
              "Enter your account's email address so recieve a password reset link.",
              style: textTheme.bodyLarge?.copyWith(color: ExtraColors.black),
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
                onPressed: () async {
                  try {
                    final message = await resetPassword(emailController.text);
                    // Handle successful password reset
                  } catch (error) {
                    // Handle error
                  }
                },
                textColor: ExtraColors.white,
                text: 'Continue'),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

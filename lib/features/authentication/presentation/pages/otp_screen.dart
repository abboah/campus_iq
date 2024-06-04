import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/themes/extra_colors.dart';
import '../widgets/auth_button.dart';

class OTPScreen extends StatelessWidget {
  static const routeName = "/otp";
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextEditingController otpController = TextEditingController();
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
                "Confirm",
                style:
                    textTheme.displayMedium!.copyWith(color: ExtraColors.white),
              ),
              Text(
                "Email",
                style:
                    textTheme.displayMedium!.copyWith(color: ExtraColors.white),
              ),
              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style:
                      textTheme.bodyLarge?.copyWith(color: ExtraColors.white),
                  children: <TextSpan>[
                    const TextSpan(text: 'Enter the digit code sent to '),
                    TextSpan(
                      text: 'example@email.com',
                      style: textTheme.bodyLarge?.copyWith(
                          color: ExtraColors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Pinput(
                  length: 5,
                  controller: otpController,
                  defaultPinTheme: defaultPinTheme),
              AuthButton(
                  textTheme: textTheme,
                  onPressed: () {},
                  backgroundColor: ExtraColors.blue,
                  textColor: ExtraColors.white,
                  text: 'Verify'),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 80,
  height: 65,
  textStyle: const TextStyle(
    fontSize: 40,
    color: ExtraColors.white,
  ),
  decoration: BoxDecoration(
    border: Border.all(color: ExtraColors.white),
    borderRadius: BorderRadius.circular(10),
  ),
);

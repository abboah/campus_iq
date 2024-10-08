
import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.textTheme,
    required this.onPressed,
    required this.textColor,
    required this.text,
    this.image,
    this.isLoading = false,
  });

  final TextTheme textTheme;
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final String? image;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 31, 107, 255),
              Color.fromARGB(153, 195, 37, 255)
            ])),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: ExtraColors.transparent),
          child: isLoading
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(ExtraColors.white),
                )
              : Text(
                  text,
                  style: textTheme.titleLarge
                      ?.copyWith(color: textColor, fontSize: 17),
                ),
        ),
      ),
    );
  }
}

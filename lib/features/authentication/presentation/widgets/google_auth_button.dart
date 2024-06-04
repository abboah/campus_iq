import 'package:flutter/material.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
    super.key,
    required this.textTheme,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.image,
  });

  final TextTheme textTheme;
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FilledButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: backgroundColor),
        child: ListTile(
          leading: Image.asset(
            'assets/images/google.png',
          ),
          titleAlignment: ListTileTitleAlignment.center,
          title: Text(
            text,
            style:
                textTheme.titleLarge?.copyWith(color: textColor, fontSize: 17),
          ),
        ),
      ),
    );
  }
}

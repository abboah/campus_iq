import 'package:flutter/material.dart';

import '../themes/extra_colors.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // gradient: const LinearGradient(colors: [
          //   Color.fromARGB(255, 31, 107, 255),
          //   Color.fromARGB(153, 195, 37, 255)
          // ])),
          color: ExtraColors.buttonOutline),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: ExtraColors.transparent),
        child: Text(
          text,
          style: textTheme.titleLarge
              ?.copyWith(color: ExtraColors.white, fontSize: 17),
        ),
      ),
    );
  }
}

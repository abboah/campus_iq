import 'package:flutter/material.dart';

import '../../../../core/themes/extra_colors.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.textTheme,
    required this.controller,
    required this.label,
    required this.obscuretext,
  });

  final TextTheme textTheme;
  final TextEditingController controller;
  final String label;
  final bool obscuretext;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: textTheme.bodyLarge!.copyWith(color: ExtraColors.white),
      obscureText: obscuretext,
      decoration: InputDecoration(
        label: Text(
          label,
          style: textTheme.bodyMedium!.copyWith(color: ExtraColors.white),
        ),
      ),
    );
  }
}

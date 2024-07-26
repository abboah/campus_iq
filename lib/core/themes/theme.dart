import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: const Color(0x002c74b3),

    // textTheme: GoogleFonts.robotoTextTheme(),
    colorScheme: ColorScheme.light(primary: ExtraColors.white));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  useMaterial3: true,
  primaryColor: const Color(0x002c74b3),
  // textTheme: GoogleFonts.robotoTextTheme(),
  colorScheme: ColorScheme.dark(primary: ExtraColors.black),
);

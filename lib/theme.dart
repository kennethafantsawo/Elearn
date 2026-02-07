// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class StudyForgeTheme {
  static const primaryColor = Color(0xFF1F6FEB);
  static const primaryDarkColor = Color(0xFF0D47A1);
  static const accentColor = Color(0xFF03DAC6);
  static const errorColor = Color(0xFFB00020);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    primarySwatch: MaterialColor(0xFF1F6FEB, <int, Color>{
      50: Color(0xFFF3F7FC),
      100: Color(0xFFDEE7F5),
      200: Color(0xFFC8D9EE),
      300: Color(0xFFB2CAE6),
      400: Color(0xFFA3BFDF),
      500: primaryColor,
      600: Color(0xFF1961E5),
      700: Color(0xFF1255D0),
      800: Color(0xFF0D47A1),
      900: Color(0xFF093A80),
    }),
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      error: errorColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: Color(0xFF121212),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor,
      error: errorColor,
    ),
  );
}

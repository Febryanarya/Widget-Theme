import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.blueAccent,
      secondary: Colors.blueAccent,
      surface: Colors.white,
      background: Colors.grey[100]!,
    ),
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    cardColor: Colors.white,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black87),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blueAccent,
      secondary: Colors.blueAccent,
      surface: Color(0xFF1E1E1E), // warna card
      background: Color(0xFF121212), // warna latar belakang
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
    cardColor: const Color(0xFF1E1E1E),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );
}

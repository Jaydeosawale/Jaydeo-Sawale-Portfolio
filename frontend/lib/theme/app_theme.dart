import 'package:flutter/material.dart';

class AppTheme {
  static const background = Color(0xFF070A10);
  static const panel = Color(0xFF0D121B);
  static const panel2 = Color(0xFF111824);
  static const cyan = Color(0xFF55E7D8);
  static const violet = Color(0xFF8B7CFF);
  static const text = Color(0xFFF3F7FC);
  static const muted = Color(0xFF9AA7B7);

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: cyan,
        secondary: violet,
        surface: panel,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: text,
          fontWeight: FontWeight.w900,
          letterSpacing: -1.8,
        ),
        headlineMedium: TextStyle(
          color: text,
          fontWeight: FontWeight.w800,
          letterSpacing: -1.0,
        ),
        titleLarge: TextStyle(
          color: text,
          fontWeight: FontWeight.w800,
        ),
        bodyLarge: TextStyle(
          color: muted,
          height: 1.7,
        ),
        bodyMedium: TextStyle(
          color: muted,
          height: 1.6,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white10,
        side: BorderSide(color: Colors.white12),
        labelStyle: const TextStyle(color: text, fontSize: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(999)),
        ),
      ),
      cardTheme: CardThemeData(
        color: panel,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(26)),
          side: BorderSide(color: Colors.white10),
        ),
      ),
    );
  }
}

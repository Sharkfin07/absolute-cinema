import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _primary = Color(0xFF0066CC);
  static const Color _onPrimary = Colors.white;
  static const Color _secondary = Color(0xFF00A896);

  static final ColorScheme _lightColorScheme = ColorScheme.fromSeed(
    seedColor: _primary,
    brightness: Brightness.light,
    primary: _primary,
    onPrimary: _onPrimary,
    secondary: _secondary,
  );

  static final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    seedColor: _primary,
    brightness: Brightness.dark,
  );

  static ThemeData light() {
    return ThemeData(
      fontFamily: 'Inter',
      colorScheme: _lightColorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: _lightColorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _lightColorScheme.primary,
          foregroundColor: _lightColorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      textTheme: _typography(_lightColorScheme),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      fontFamily: 'Inter',
      colorScheme: _darkColorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: _darkColorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: _darkColorScheme.surface,
        foregroundColor: _darkColorScheme.onSurface,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _darkColorScheme.primary,
          foregroundColor: _darkColorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      textTheme: _typography(_darkColorScheme),
    );
  }

  static TextTheme _typography(ColorScheme colors) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: colors.onSurface,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: colors.onSurface,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: colors.onSurface),
      bodyMedium: TextStyle(fontSize: 14, color: colors.onSurface),
    );
  }
}

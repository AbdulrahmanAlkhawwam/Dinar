import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import './colors.dart';
import './styles.dart';

class AppTheme {
  static ThemeData get lightTheme => _theme(lightColorScheme, lightGradient);

  static ThemeData get darkTheme => _theme(darkColorScheme, darkGradient);

  static _theme(ColorScheme colors, GradientColor gradient) => ThemeData(
      colorScheme: colors,
      primaryColor: colors.primary,
      canvasColor: colors.onTertiaryContainer,
      useMaterial3: true,
      textTheme: _textTheme(colors),
      appBarTheme: _appBarTheme(colors),
      scaffoldBackgroundColor: colors.surface,
      textButtonTheme: _textButtonTheme(colors),
      inputDecorationTheme: _inputDecorationTheme(colors),
      datePickerTheme: _datePickerTheme(colors),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size(24, 24)),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.surface,
      ),
      extensions: [gradient]);

  static AppBarTheme _appBarTheme(ColorScheme colors) {
    return AppBarTheme(
      titleTextStyle: GoogleFonts.poppins(
        color: colors.onTertiaryContainer,
        fontSize: 26,
      ),
      centerTitle: true,
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colors) {
    return InputDecorationTheme(
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(circle),
        borderSide: BorderSide(
          color: colors.outline,
          width: 3,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(circle),
        borderSide: BorderSide(
          color: colors.primary,
          width: 3,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(circle),
        borderSide: BorderSide(
          color: colors.primaryContainer,
          width: 3,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(circle),
        borderSide: BorderSide(
          color: colors.error,
          width: 3,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(circle),
        borderSide: BorderSide(
          color: colors.errorContainer,
          width: 3,
        ),
      ),
      hintStyle:
          _textTheme(colors).bodyMedium?.copyWith(color: colors.onSurface),
      errorStyle: _textTheme(colors).bodySmall?.copyWith(color: colors.error),
    );
  }

  static TextButtonThemeData _textButtonTheme(ColorScheme colors) {
    return TextButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        fixedSize: const WidgetStatePropertyAll(Size(200, 48)),
        shape: const WidgetStatePropertyAll(StadiumBorder()),
        textStyle: WidgetStatePropertyAll(
          _textTheme(colors).labelLarge,
        ),
      ),
    );
  }

  static _datePickerTheme(ColorScheme colors) {
    return DatePickerThemeData(
      backgroundColor: colors.primaryContainer,
      dividerColor: colors.primary,
      dayStyle: _textTheme(colors).bodySmall,
      headerBackgroundColor: colors.primary,
      headerForegroundColor: colors.onPrimaryContainer,
      todayForegroundColor: WidgetStatePropertyAll(colors.secondary),
      yearForegroundColor: WidgetStatePropertyAll(colors.secondary),
      confirmButtonStyle: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
        fixedSize: WidgetStatePropertyAll(Size(double.nan, double.minPositive)),
        textStyle: WidgetStatePropertyAll(
          _textTheme(colors).labelMedium,
        ),
      ),
      cancelButtonStyle: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
        fixedSize: WidgetStatePropertyAll(Size(double.nan, double.minPositive)),
        textStyle: WidgetStatePropertyAll(
          _textTheme(colors).labelLarge,
        ),
      ),
    );
  }

  static TextTheme _textTheme(ColorScheme colors) {
    return TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 42,
        fontWeight: FontWeight.w400,
        height: 46 / 40,
        color: colors.onTertiaryContainer,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        height: 28 / 32,
        color: colors.onTertiaryContainer,
      ),
      displaySmall: null,
      headlineLarge: GoogleFonts.poppins(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        height: 34 / 28,
        color: colors.onTertiaryContainer,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        height: 30 / 24,
        color: colors.onTertiaryContainer,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 26,
        fontWeight: FontWeight.w500,
        height: 24 / 20,
        color: colors.onTertiaryContainer,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 40 / 24,
        color: colors.onTertiaryContainer,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 20 / 18,
        color: colors.onTertiaryContainer,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 25 / 16,
        color: colors.onTertiaryContainer,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 28 / 22,
        color: colors.onTertiaryContainer,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        height: 20 / 18,
        color: colors.onTertiaryContainer,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 20 / 16,
        color: colors.onTertiaryContainer,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 18 / 16,
        color: colors.onTertiaryContainer,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 16 / 14,
        color: colors.onTertiaryContainer,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 12,
        color: colors.onTertiaryContainer,
      ),
    );
  }
}

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import './colors.dart';
import '../constants/styles.dart';

class AppTheme {
  static ThemeData get lightTheme => _theme(lightColorScheme);

  static ThemeData get darkTheme => _theme(darkColorScheme);

  static _theme(ColorScheme colors) => ThemeData(
        colorScheme: colors,
        primaryColor: colors.primary,
        canvasColor: colors.onTertiaryContainer,
        useMaterial3: true,
        textTheme: _textTheme(colors),
        appBarTheme: _appBarTheme(colors),
        scaffoldBackgroundColor: colors.surface,
        textButtonTheme: _textButtonTheme(colors),
        inputDecorationTheme: _inputDecorationTheme(colors),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: colors.surface),

        /// we don't use default button . so, we cancel it temporary
        // elevatedButtonTheme: _elevatedButtonTheme(colors),
        // outlinedButtonTheme: _outlinedButtonTheme(colors),
        // dividerTheme: _buildDividerTheme(colors),
      );

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
          color: colors.secondaryContainer,
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
      labelStyle: GoogleFonts.poppins(
        height: 0,
        fontSize: 18,
        color: colors.onTertiaryContainer,
      ),
      hintStyle: GoogleFonts.poppins(
        height: 0,
        fontSize: 18,
        color: colors.onTertiaryContainer,
      ),
      errorStyle: GoogleFonts.poppins(
        height: 0,
        fontSize: 18,
        color: colors.error,
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme(ColorScheme colors) {
    return TextButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        fixedSize: const WidgetStatePropertyAll(Size(200, 48)),
        shape: const WidgetStatePropertyAll(StadiumBorder()),
        textStyle: WidgetStatePropertyAll(
          GoogleFonts.poppins(
            fontSize: 20,
          ),
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

  static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme colors) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(mediumRadius),
            ),
        minimumSize: const Size(200, 50),
        shadowColor: colors.shadow,
        elevation: 8,
        textStyle: GoogleFonts.poppins(
          fontSize: 20,
        ),
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme colors) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(mediumRadius),
            ),
        side: BorderSide(color: colors.onBackground),
        minimumSize: const Size(200, 50),
        textStyle: GoogleFonts.poppins(
          fontSize: 20,
        ),
      ),
    );
  }

  static _buildDividerTheme(ColorScheme colors) {
    return DividerThemeData(
      color: colors.outline,
    );
  }
}

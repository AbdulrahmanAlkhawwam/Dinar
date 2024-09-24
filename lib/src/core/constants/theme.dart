// import 'package:flutter/material.dart';
//
// import 'colors.dart';
// import 'styles.dart';
//
// class AppTheme {
//   static ThemeData get lightTheme => _theme(lightColorScheme);
//
//   static ThemeData get darkTheme => _theme(darkColorScheme);
//
//   static _theme(ColorScheme colors) => ThemeData(
//         fontFamily: "AraHamahHoms",
//         colorScheme: colors,
//         primaryColor: colors.primary,
//         canvasColor: colors.background,
//         useMaterial3: true,
//         appBarTheme: _appBarTheme(colors),
//         textTheme: _textTheme(colors),
//         elevatedButtonTheme: _elevatedButtonTheme(colors),
//         outlinedButtonTheme: _outlinedButtonTheme(colors),
//         textButtonTheme: _textButtonTheme(colors),
//         inputDecorationTheme: _inputDecorationTheme(colors),
//         dividerTheme: _buildDividerTheme(colors),
//       );
//
//   static AppBarTheme _appBarTheme(ColorScheme colors) {
//     return AppBarTheme(
//       titleTextStyle: TextStyle(
//         color: colors.onBackground,
//         fontFamily: "AraHamahHoms",
//         fontSize: 24,
//         fontWeight: FontWeight.normal,
//       ),
//       centerTitle: true,
//       surfaceTintColor: colors.primary,
//     );
//   }
//
//   static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme colors) {
//     return ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(mediumRadius),
//         ),
//         minimumSize: Size(200, 50),
//         shadowColor: colors.shadow,
//         elevation: 8,
//         textStyle: TextStyle(
//           fontFamily: "AraHamahHoms",
//           fontSize: 20,
//         ),
//         backgroundColor: colors.primary,
//         foregroundColor: colors.onPrimary,
//       ),
//     );
//   }
//
//   static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme colors) {
//     return OutlinedButtonThemeData(
//       style: OutlinedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(mediumRadius),
//         ),
//         side: BorderSide(color: colors.onBackground),
//         minimumSize: Size(200, 50),
//         textStyle: TextStyle(
//           fontFamily: "AraHamahHoms",
//           fontSize: 20,
//         ),
//       ),
//     );
//   }
//
//   static TextButtonThemeData _textButtonTheme(ColorScheme colors) {
//     return TextButtonThemeData(
//       style: TextButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(smallRadius),
//         ),
//         textStyle: TextStyle(
//           fontFamily: "AraHamahHoms",
//           fontSize: 20,
//         ),
//       ),
//     );
//   }
//
//   static InputDecorationTheme _inputDecorationTheme(ColorScheme colors) {
//     return InputDecorationTheme(
//       filled: true,
//       fillColor: colors.surfaceVariant,
//       labelStyle: TextStyle(
//         fontFamily: "AraHamahHoms",
//         fontSize: 20,
//         color: colors.onSurfaceVariant,
//       ),
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       hintStyle: TextStyle(
//         fontFamily: "AraHamahHoms",
//         fontSize: 20,
//         color: colors.onSurfaceVariant,
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(mediumRadius),
//         borderSide: BorderSide.none,
//       ),
//       errorStyle: TextStyle(
//         fontSize: 16,
//         color: colors.error,
//       ),
//     );
//   }
//
//   static _buildDividerTheme(ColorScheme colors) {
//     return DividerThemeData(
//       color: colors.outline,
//     );
//   }
//
//   static TextTheme _textTheme(ColorScheme colors) {
//     return TextTheme(
//       displayLarge: TextStyle(
//         fontSize: 42,
//         fontWeight: FontWeight.w400,
//         height: 46 / 40,
//         color: colors.onBackground,
//       ),
//       displayMedium: TextStyle(
//         fontSize: 36,
//         fontWeight: FontWeight.w400,
//         height: 28 / 32,
//         color: colors.onBackground,
//       ),
//       displaySmall: null,
//       headlineLarge: TextStyle(
//         fontSize: 34,
//         fontWeight: FontWeight.w500,
//         height: 34 / 28,
//         color: colors.onBackground,
//       ),
//       headlineMedium: TextStyle(
//         fontSize: 30,
//         fontWeight: FontWeight.w500,
//         height: 30 / 24,
//         color: colors.onBackground,
//       ),
//       headlineSmall: TextStyle(
//         fontSize: 26,
//         fontWeight: FontWeight.w500,
//         height: 24 / 20,
//         color: colors.onBackground,
//       ),
//       titleLarge: TextStyle(
//         fontSize: 28,
//         fontWeight: FontWeight.w700,
//         height: 40 / 24,
//         color: colors.onBackground,
//       ),
//       titleMedium: TextStyle(
//         fontSize: 22,
//         fontWeight: FontWeight.w700,
//         height: 20 / 18,
//         color: colors.onBackground,
//       ),
//       titleSmall: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w700,
//         height: 25 / 16,
//         color: colors.onBackground,
//       ),
//       bodyLarge: TextStyle(
//         fontSize: 24,
//         fontWeight: FontWeight.w400,
//         height: 28 / 22,
//         color: colors.onBackground,
//       ),
//       bodyMedium: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w400,
//         height: 20 / 18,
//         color: colors.onBackground,
//       ),
//       bodySmall: TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.w400,
//         height: 20 / 16,
//         color: colors.onBackground,
//       ),
//       labelLarge: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w400,
//         height: 18 / 16,
//         color: colors.onBackground,
//       ),
//       labelMedium: TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.w400,
//         height: 16 / 14,
//         color: colors.onBackground,
//       ),
//       labelSmall: TextStyle(
//         fontSize: 14,
//         fontWeight: FontWeight.w400,
//         height: 20 / 12,
//         color: colors.onBackground,
//       ),
//     );
//   }
// }

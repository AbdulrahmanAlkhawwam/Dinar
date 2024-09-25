import 'package:flutter/material.dart';

import 'main_colors.dart';

class LightColors {
  // for buttons

  // for onboarding text
  static LinearGradient onBoardingTextColor = LinearGradient(
    colors: [MainColors.darkTeal, MainColors.forestGreen],
  );

  // default background
  static LinearGradient backgroundColor = LinearGradient(
    colors: [
      MainColors.teaGreen,
      MainColors.forestGreen,
    ],
    begin: Alignment.centerRight,
    end: Alignment.bottomLeft,
  );

  // for card
  static LinearGradient widgetCardColor = LinearGradient(
    colors: [
      MainColors.teaGreen,
      MainColors.mintCream,
    ],
    begin: Alignment.center,
    end: Alignment.topRight,
  );

  // static ColorScheme lightScheme = const ColorScheme(
  //   brightness: Brightness.light,
  //   primary: Color(0xFF4CA771),
  //   onPrimary: Color(0xFFEAF9E7),
  //   secondary: Color(0xFFC0E6BA),
  //   onSecondary: Color(0xffffffff),
  //   error: Color(0xFFA74C4C),
  //   onError: Color(0xffffffff),
  //   errorContainer: Color(0xFFE6BABA),
  //   onErrorContainer: Color(0x82C71B1B),
  //   surface: Color(0xFFEAF9E7),
  //   onSurface: Color(0xFF013237),
  // );
}

// class MaterialTheme {
//   final TextTheme textTheme;
//
//   const MaterialTheme(this.textTheme);
//
// // ThemeData light() {
// //   return theme(lightScheme());
// // }
// //
// // static ColorScheme lightMediumContrastScheme() {
// //   return const ColorScheme(
// //     brightness: Brightness.light,
// //     primary: Color(4278668588),
// //     surfaceTint: Color(4281100869),
// //     onPrimary: Color(4294967295),
// //     primaryContainer: Color(4282614106),
// //     onPrimaryContainer: Color(4294967295),
// //     secondary: Color(4280175649),
// //     onSecondary: Color(4294967295),
// //     secondaryContainer: Color(4283465807),
// //     onSecondaryContainer: Color(4294967295),
// //     tertiary: Color(4280109139),
// //     onTertiary: Color(4294967295),
// //     tertiaryContainer: Color(4283530119),
// //     onTertiaryContainer: Color(4294967295),
// //     error: Color(4285411119),
// //     onError: Color(4294967295),
// //     errorContainer: Color(4289355614),
// //     onErrorContainer: Color(4294967295),
// //     surface: Color(4294441970),
// //     onSurface: Color(4279770392),
// //     onSurfaceVariant: Color(4282074182),
// //     outline: Color(4283916642),
// //     outlineVariant: Color(4285758590),
// //     shadow: Color(4278190080),
// //     scrim: Color(4278190080),
// //     inverseSurface: Color(4281152044),
// //     inversePrimary: Color(4287944104),
// //     primaryFixed: Color(4282614106),
// //     onPrimaryFixed: Color(4294967295),
// //     primaryFixedDim: Color(4280903491),
// //     onPrimaryFixedVariant: Color(4294967295),
// //     secondaryFixed: Color(4283465807),
// //     onSecondaryFixed: Color(4294967295),
// //     secondaryFixedDim: Color(4281886264),
// //     onSecondaryFixedVariant: Color(4294967295),
// //     tertiaryFixed: Color(4283530119),
// //     onTertiaryFixed: Color(4294967295),
// //     tertiaryFixedDim: Color(4281885293),
// //     onTertiaryFixedVariant: Color(4294967295),
// //     surfaceDim: Color(4292336595),
// //     surfaceBright: Color(4294441970),
// //     surfaceContainerLowest: Color(4294967295),
// //     surfaceContainerLow: Color(4294047213),
// //     surfaceContainer: Color(4293652455),
// //     surfaceContainerHigh: Color(4293257697),
// //     surfaceContainerHighest: Color(4292928732),
// //   );
// // }
// //
// // ThemeData lightMediumContrast() {
// //   return theme(lightMediumContrastScheme());
// // }
// //
// // static ColorScheme lightHighContrastScheme() {
// //   return const ColorScheme(
// //     brightness: Brightness.light,
// //     primary: Color(4278200596),
// //     surfaceTint: Color(4281100869),
// //     onPrimary: Color(4294967295),
// //     primaryContainer: Color(4278668588),
// //     onPrimaryContainer: Color(4294967295),
// //     secondary: Color(4278200583),
// //     onSecondary: Color(4294967295),
// //     secondaryContainer: Color(4280175649),
// //     onSecondaryContainer: Color(4294967295),
// //     tertiary: Color(4278199855),
// //     onTertiary: Color(4294967295),
// //     tertiaryContainer: Color(4280109139),
// //     onTertiaryContainer: Color(4294967295),
// //     error: Color(4282650385),
// //     onError: Color(4294967295),
// //     errorContainer: Color(4285411119),
// //     onErrorContainer: Color(4294967295),
// //     surface: Color(4294441970),
// //     onSurface: Color(4278190080),
// //     onSurfaceVariant: Color(4280034599),
// //     outline: Color(4282074182),
// //     outlineVariant: Color(4282074182),
// //     shadow: Color(4278190080),
// //     scrim: Color(4278190080),
// //     inverseSurface: Color(4281152044),
// //     inversePrimary: Color(4290378700),
// //     primaryFixed: Color(4278668588),
// //     onPrimaryFixed: Color(4294967295),
// //     primaryFixedDim: Color(4278203675),
// //     onPrimaryFixedVariant: Color(4294967295),
// //     secondaryFixed: Color(4280175649),
// //     onSecondaryFixed: Color(4294967295),
// //     secondaryFixedDim: Color(4278400269),
// //     onSecondaryFixedVariant: Color(4294967295),
// //     tertiaryFixed: Color(4280109139),
// //     onTertiaryFixed: Color(4294967295),
// //     tertiaryFixedDim: Color(4278202940),
// //     onTertiaryFixedVariant: Color(4294967295),
// //     surfaceDim: Color(4292336595),
// //     surfaceBright: Color(4294441970),
// //     surfaceContainerLowest: Color(4294967295),
// //     surfaceContainerLow: Color(4294047213),
// //     surfaceContainer: Color(4293652455),
// //     surfaceContainerHigh: Color(4293257697),
// //     surfaceContainerHighest: Color(4292928732),
// //   );
// // }
// //
// // ThemeData lightHighContrast() {
// //   return theme(lightHighContrastScheme());
// // }
//
// ThemeData theme(ColorScheme colorScheme) => ThemeData(
//       useMaterial3: true,
//       brightness: colorScheme.brightness,
//       colorScheme: colorScheme,
//       textTheme: textTheme.apply(
//         bodyColor: colorScheme.onSurface,
//         displayColor: colorScheme.onSurface,
//       ),
//       scaffoldBackgroundColor: colorScheme.background,
//       canvasColor: colorScheme.surface,
//     );
// }

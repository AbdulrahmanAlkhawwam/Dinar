import 'package:flutter/material.dart';

import 'main_colors.dart';

class LightColors {
  // for buttons
  static LinearGradient primaryButtonColorEnabled = LinearGradient(
    colors: [
      MainColors.darkTeal,
      MainColors.forestGreen,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  );
  static LinearGradient secondaryButtonColorEnabled = LinearGradient(colors: [
    MainColors.forestGreen,
    MainColors.mintCream,
  ], begin: Alignment.bottomCenter, end: Alignment.topRight);
  static LinearGradient disabledButtonColor = LinearGradient(
    colors: [
      MainColors.darkGray,
      MainColors.lightGray,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  );

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

  static ColorScheme lightScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF4CA771),
    onPrimary: Color(0xFFEAF9E7),
    secondary: Color(0xFFC0E6BA),
    onSecondary: Color(0xffffffff),
    error: Color(0xFFA74C4C),
    onError: Color(0xffffffff),
    errorContainer: Color(0xFFE6BABA),
    onErrorContainer: Color(0x82C71B1B),
    surface: Color(0xFFEAF9E7),
    onSurface: Color(0xFF013237),
  );
}

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  // static ColorScheme lightScheme() {
  //   return const ColorScheme(
  //     // brightness: Brightness.light,
  //     // primary: Color(0xff2c6a45),
  //     surfaceTint: Color(4281100869),
  //     // onPrimary: Color(4294967295),
  //     primaryContainer: Color(4289786307),
  //     onPrimaryContainer: Color(4278198543),
  //     secondary: Color(4282018106),
  //     onSecondary: Color(4294967295),
  //     secondaryContainer: Color(4290506933),
  //     onSecondaryContainer: Color(4278198533),
  //     tertiary: Color(4282082416),
  //     onTertiary: Color(4294967295),
  //     tertiaryContainer: Color(4290702071),
  //     onTertiaryContainer: Color(4278198054),
  //     // error: Color(4287646281),
  //     // onError: Color(4294967295),
  //     // errorContainer: Color(4294957784),
  //     // onErrorContainer: Color(4282058763),
  //     // surface: Color(4294441970),
  //     // onSurface: Color(4279770392),
  //     onSurfaceVariant: Color(4282337354),
  //     outline: Color(4285495674),
  //     outlineVariant: Color(4290693322),
  //     shadow: Color(4278190080),
  //     scrim: Color(4278190080),
  //     inverseSurface: Color(4281152044),
  //     inversePrimary: Color(4287944104),
  //     primaryFixed: Color(4289786307),
  //     onPrimaryFixed: Color(4278198543),
  //     primaryFixedDim: Color(4287944104),
  //     onPrimaryFixedVariant: Color(4279128367),
  //     secondaryFixed: Color(4290506933),
  //     onSecondaryFixed: Color(4278198533),
  //     secondaryFixedDim: Color(4288730267),
  //     onSecondaryFixedVariant: Color(4280438821),
  //     tertiaryFixed: Color(4290702071),
  //     onTertiaryFixed: Color(4278198054),
  //     tertiaryFixedDim: Color(4288925147),
  //     onTertiaryFixedVariant: Color(4280372311),
  //     surfaceDim: Color(4292336595),
  //     surfaceBright: Color(4294441970),
  //     surfaceContainerLowest: Color(4294967295),
  //     surfaceContainerLow: Color(4294047213),
  //     surfaceContainer: Color(4293652455),
  //     surfaceContainerHigh: Color(4293257697),
  //     surfaceContainerHighest: Color(4292928732),
  //   );
  // }

// ThemeData light() {
//   return theme(lightScheme());
// }

// static ColorScheme lightMediumContrastScheme() {
//   return const ColorScheme(
//     brightness: Brightness.light,
//     primary: Color(4278668588),
//     surfaceTint: Color(4281100869),
//     onPrimary: Color(4294967295),
//     primaryContainer: Color(4282614106),
//     onPrimaryContainer: Color(4294967295),
//     secondary: Color(4280175649),
//     onSecondary: Color(4294967295),
//     secondaryContainer: Color(4283465807),
//     onSecondaryContainer: Color(4294967295),
//     tertiary: Color(4280109139),
//     onTertiary: Color(4294967295),
//     tertiaryContainer: Color(4283530119),
//     onTertiaryContainer: Color(4294967295),
//     error: Color(4285411119),
//     onError: Color(4294967295),
//     errorContainer: Color(4289355614),
//     onErrorContainer: Color(4294967295),
//     surface: Color(4294441970),
//     onSurface: Color(4279770392),
//     onSurfaceVariant: Color(4282074182),
//     outline: Color(4283916642),
//     outlineVariant: Color(4285758590),
//     shadow: Color(4278190080),
//     scrim: Color(4278190080),
//     inverseSurface: Color(4281152044),
//     inversePrimary: Color(4287944104),
//     primaryFixed: Color(4282614106),
//     onPrimaryFixed: Color(4294967295),
//     primaryFixedDim: Color(4280903491),
//     onPrimaryFixedVariant: Color(4294967295),
//     secondaryFixed: Color(4283465807),
//     onSecondaryFixed: Color(4294967295),
//     secondaryFixedDim: Color(4281886264),
//     onSecondaryFixedVariant: Color(4294967295),
//     tertiaryFixed: Color(4283530119),
//     onTertiaryFixed: Color(4294967295),
//     tertiaryFixedDim: Color(4281885293),
//     onTertiaryFixedVariant: Color(4294967295),
//     surfaceDim: Color(4292336595),
//     surfaceBright: Color(4294441970),
//     surfaceContainerLowest: Color(4294967295),
//     surfaceContainerLow: Color(4294047213),
//     surfaceContainer: Color(4293652455),
//     surfaceContainerHigh: Color(4293257697),
//     surfaceContainerHighest: Color(4292928732),
//   );
// }
//
// ThemeData lightMediumContrast() {
//   return theme(lightMediumContrastScheme());
// }
//
// static ColorScheme lightHighContrastScheme() {
//   return const ColorScheme(
//     brightness: Brightness.light,
//     primary: Color(4278200596),
//     surfaceTint: Color(4281100869),
//     onPrimary: Color(4294967295),
//     primaryContainer: Color(4278668588),
//     onPrimaryContainer: Color(4294967295),
//     secondary: Color(4278200583),
//     onSecondary: Color(4294967295),
//     secondaryContainer: Color(4280175649),
//     onSecondaryContainer: Color(4294967295),
//     tertiary: Color(4278199855),
//     onTertiary: Color(4294967295),
//     tertiaryContainer: Color(4280109139),
//     onTertiaryContainer: Color(4294967295),
//     error: Color(4282650385),
//     onError: Color(4294967295),
//     errorContainer: Color(4285411119),
//     onErrorContainer: Color(4294967295),
//     surface: Color(4294441970),
//     onSurface: Color(4278190080),
//     onSurfaceVariant: Color(4280034599),
//     outline: Color(4282074182),
//     outlineVariant: Color(4282074182),
//     shadow: Color(4278190080),
//     scrim: Color(4278190080),
//     inverseSurface: Color(4281152044),
//     inversePrimary: Color(4290378700),
//     primaryFixed: Color(4278668588),
//     onPrimaryFixed: Color(4294967295),
//     primaryFixedDim: Color(4278203675),
//     onPrimaryFixedVariant: Color(4294967295),
//     secondaryFixed: Color(4280175649),
//     onSecondaryFixed: Color(4294967295),
//     secondaryFixedDim: Color(4278400269),
//     onSecondaryFixedVariant: Color(4294967295),
//     tertiaryFixed: Color(4280109139),
//     onTertiaryFixed: Color(4294967295),
//     tertiaryFixedDim: Color(4278202940),
//     onTertiaryFixedVariant: Color(4294967295),
//     surfaceDim: Color(4292336595),
//     surfaceBright: Color(4294441970),
//     surfaceContainerLowest: Color(4294967295),
//     surfaceContainerLow: Color(4294047213),
//     surfaceContainer: Color(4293652455),
//     surfaceContainerHigh: Color(4293257697),
//     surfaceContainerHighest: Color(4292928732),
//   );
// }
//
// ThemeData lightHighContrast() {
//   return theme(lightHighContrastScheme());
// }
//
// static ColorScheme darkScheme() {
//   return const ColorScheme(
//     brightness: Brightness.dark,
//     primary: Color(4287944104),
//     surfaceTint: Color(4287944104),
//     onPrimary: Color(4278204702),
//     primaryContainer: Color(4279128367),
//     onPrimaryContainer: Color(4289786307),
//     secondary: Color(4288730267),
//     onSecondary: Color(4278728976),
//     secondaryContainer: Color(4280438821),
//     onSecondaryContainer: Color(4290506933),
//     tertiary: Color(4288925147),
//     onTertiary: Color(4278335040),
//     tertiaryContainer: Color(4280372311),
//     onTertiaryContainer: Color(4290702071),
//     error: Color(4294947761),
//     onError: Color(4283899166),
//     errorContainer: Color(4285739827),
//     onErrorContainer: Color(4294957784),
//     surface: Color(4279244048),
//     onSurface: Color(4292928732),
//     onSurfaceVariant: Color(4290693322),
//     outline: Color(4287206036),
//     outlineVariant: Color(4282337354),
//     shadow: Color(4278190080),
//     scrim: Color(4278190080),
//     inverseSurface: Color(4292928732),
//     inversePrimary: Color(4281100869),
//     primaryFixed: Color(4289786307),
//     onPrimaryFixed: Color(4278198543),
//     primaryFixedDim: Color(4287944104),
//     onPrimaryFixedVariant: Color(4279128367),
//     secondaryFixed: Color(4290506933),
//     onSecondaryFixed: Color(4278198533),
//     secondaryFixedDim: Color(4288730267),
//     onSecondaryFixedVariant: Color(4280438821),
//     tertiaryFixed: Color(4290702071),
//     onTertiaryFixed: Color(4278198054),
//     tertiaryFixedDim: Color(4288925147),
//     onTertiaryFixedVariant: Color(4280372311),
//     surfaceDim: Color(4279244048),
//     surfaceBright: Color(4281743925),
//     surfaceContainerLowest: Color(4278914827),
//     surfaceContainerLow: Color(4279770392),
//     surfaceContainer: Color(4280033564),
//     surfaceContainerHigh: Color(4280691494),
//     surfaceContainerHighest: Color(4281415217),
//   );
// }
//
// ThemeData dark() {
//   return theme(darkScheme());
// }
//
// static ColorScheme darkMediumContrastScheme() {
//   return const ColorScheme(
//     brightness: Brightness.dark,
//     primary: Color(4288272812),
//     surfaceTint: Color(4287944104),
//     onPrimary: Color(4278197003),
//     primaryContainer: Color(4284522101),
//     onPrimaryContainer: Color(4278190080),
//     secondary: Color(4288993439),
//     onSecondary: Color(4278196996),
//     secondaryContainer: Color(4285242729),
//     onSecondaryContainer: Color(4278190080),
//     tertiary: Color(4289188575),
//     onTertiary: Color(4278196512),
//     tertiaryContainer: Color(4285372324),
//     onTertiaryContainer: Color(4278190080),
//     error: Color(4294949303),
//     onError: Color(4281598983),
//     errorContainer: Color(4291525241),
//     onErrorContainer: Color(4278190080),
//     surface: Color(4279244048),
//     onSurface: Color(4294507764),
//     onSurfaceVariant: Color(4291022030),
//     outline: Color(4288390566),
//     outlineVariant: Color(4286285190),
//     shadow: Color(4278190080),
//     scrim: Color(4278190080),
//     inverseSurface: Color(4292928732),
//     inversePrimary: Color(4279259952),
//     primaryFixed: Color(4289786307),
//     onPrimaryFixed: Color(4278195464),
//     primaryFixedDim: Color(4287944104),
//     onPrimaryFixedVariant: Color(4278206242),
//     secondaryFixed: Color(4290506933),
//     onSecondaryFixed: Color(4278195714),
//     secondaryFixedDim: Color(4288730267),
//     onSecondaryFixedVariant: Color(4279189270),
//     tertiaryFixed: Color(4290702071),
//     onTertiaryFixed: Color(4278195225),
//     tertiaryFixedDim: Color(4288925147),
//     onTertiaryFixedVariant: Color(4278926150),
//     surfaceDim: Color(4279244048),
//     surfaceBright: Color(4281743925),
//     surfaceContainerLowest: Color(4278914827),
//     surfaceContainerLow: Color(4279770392),
//     surfaceContainer: Color(4280033564),
//     surfaceContainerHigh: Color(4280691494),
//     surfaceContainerHighest: Color(4281415217),
//   );
// }
//
// ThemeData darkMediumContrast() {
//   return theme(darkMediumContrastScheme());
// }
//
// static ColorScheme darkHighContrastScheme() {
//   return const ColorScheme(
//     brightness: Brightness.dark,
//     primary: Color(4293918704),
//     surfaceTint: Color(4287944104),
//     onPrimary: Color(4278190080),
//     primaryContainer: Color(4288272812),
//     onPrimaryContainer: Color(4278190080),
//     secondary: Color(4294049770),
//     onSecondary: Color(4278190080),
//     secondaryContainer: Color(4288993439),
//     onSecondaryContainer: Color(4278190080),
//     tertiary: Color(4294245631),
//     onTertiary: Color(4278190080),
//     tertiaryContainer: Color(4289188575),
//     onTertiaryContainer: Color(4278190080),
//     error: Color(4294965753),
//     onError: Color(4278190080),
//     errorContainer: Color(4294949303),
//     onErrorContainer: Color(4278190080),
//     surface: Color(4279244048),
//     onSurface: Color(4294967295),
//     onSurfaceVariant: Color(4294180350),
//     outline: Color(4291022030),
//     outlineVariant: Color(4291022030),
//     shadow: Color(4278190080),
//     scrim: Color(4278190080),
//     inverseSurface: Color(4292928732),
//     inversePrimary: Color(4278202649),
//     primaryFixed: Color(4290049735),
//     onPrimaryFixed: Color(4278190080),
//     primaryFixedDim: Color(4288272812),
//     onPrimaryFixedVariant: Color(4278197003),
//     secondaryFixed: Color(4290770361),
//     onSecondaryFixed: Color(4278190080),
//     secondaryFixedDim: Color(4288993439),
//     onSecondaryFixedVariant: Color(4278196996),
//     tertiaryFixed: Color(4291030780),
//     onTertiaryFixed: Color(4278190080),
//     tertiaryFixedDim: Color(4289188575),
//     onTertiaryFixedVariant: Color(4278196512),
//     surfaceDim: Color(4279244048),
//     surfaceBright: Color(4281743925),
//     surfaceContainerLowest: Color(4278914827),
//     surfaceContainerLow: Color(4279770392),
//     surfaceContainer: Color(4280033564),
//     surfaceContainerHigh: Color(4280691494),
//     surfaceContainerHighest: Color(4281415217),
//   );
// }
//
// ThemeData darkHighContrast() {
//   return theme(darkHighContrastScheme());
// }
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
}

import 'package:flutter/material.dart';

/// LIGHT MODE COLOR
///
///
/// COLOR THEME : [lightColorScheme] , but it's only for light THEME
/// it it's created by [Material.io] which you can visited it in this link
/// [https://amaterial-foundation.github.io/material-theme-builder/]
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff2c6a45),
  surfaceTint: Color(0xff2c6a45),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffb0f1c3),
  onPrimaryContainer: Color(0xff00210f),
  secondary: Color(0xff3a693a),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffbbf0b5),
  onSecondaryContainer: Color(0xff002105),
  tertiary: Color(0xff3b6470),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffbeeaf7),
  onTertiaryContainer: Color(0xff001f26),
  error: Color(0xff904a49),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad8),
  onErrorContainer: Color(0xff3b080b),
  surface: Color(0xfff7fbf2),
  onSurface: Color(0xff181d18),
  onSurfaceVariant: Color(0xff3f484a),
  outline: Color(0xff6f797a),
  outlineVariant: Color(0xffbec8ca),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff2d322c),
  inversePrimary: Color(0xff94d5a8),
  primaryFixed: Color(0xffb0f1c3),
  onPrimaryFixed: Color(0xff00210f),
  primaryFixedDim: Color(0xff94d5a8),
  onPrimaryFixedVariant: Color(0xff0e512f),
  secondaryFixed: Color(0xffbbf0b5),
  onSecondaryFixed: Color(0xff002105),
  secondaryFixedDim: Color(0xffa0d49b),
  onSecondaryFixedVariant: Color(0xff225025),
  tertiaryFixed: Color(0xffbeeaf7),
  // don't use this var , use onTertiaryContainer
  onTertiaryFixed: Color(0xff001f26),
  tertiaryFixedDim: Color(0xffa3cddb),
  onTertiaryFixedVariant: Color(0xff214c57),
  surfaceDim: Color(0xffd7dbd3),
  surfaceBright: Color(0xfff7fbf2),
  surfaceContainerLowest: Color(0xffffffff),
  surfaceContainerLow: Color(0xfff1f5ed),
  surfaceContainer: Color(0xffebefe7),
  surfaceContainerHigh: Color(0xffe5e9e1),
  surfaceContainerHighest: Color(0xffe0e4dc),
);

/// LINEAR GRADIENT class : [GradientLightColor]
class GradientLightColor {
  /// disabled color used when some thing don't used at all ,like [bottom], [card] , ... etc
  /// it's begin [Alignment.bottomCenter] and end [Alignment.topRight]
  /// we used colors [onSurfaceVariant], [outlineVariant]
  static LinearGradient disabledColor = LinearGradient(
    colors: <Color>[
      lightColorScheme.onSurfaceVariant,
      lightColorScheme.outlineVariant,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  );

  /// primary color used in any thing like [bottom], [card] , ... etc
  /// it's begin [Alignment.bottomCenter] and end [Alignment.topRight]
  /// we used colors [onTertiaryFixed], [primary]
  static LinearGradient primaryColor = LinearGradient(
    colors: [
      lightColorScheme.onTertiaryFixed,
      lightColorScheme.primary.withGreen(150),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  );

  /// secondary color used in any thing like [bottom], [card] , ... etc
  /// it's begin [Alignment.bottomCenter] and end [Alignment.topRight]
  /// we used colors [secondaryFixedDim], [surface]
  static LinearGradient secondaryColor = LinearGradient(
    colors: [
      lightColorScheme.secondaryFixedDim,
      lightColorScheme.surface,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  );

  /// background color used only onboarding screen
  /// it's begin [Alignment.centerRight] and end [Alignment.bottomLeft]
  /// we used colors [inversePrimary], [primary]
  static LinearGradient backgroundColor = LinearGradient(
    colors: [
      lightColorScheme.inversePrimary,
      lightColorScheme.primary,
    ],
    begin: Alignment.centerRight,
    end: Alignment.bottomLeft,
  );
}

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff94d5a8),
  surfaceTint: Color(0xff94d5a8),
  onPrimary: Color(0xff00391e),
  primaryContainer: Color(0xff0e512f),
  onPrimaryContainer: Color(0xffb0f1c3),
  secondary: Color(0xffa0d49b),
  onSecondary: Color(0xff083910),
  secondaryContainer: Color(0xff225025),
  onSecondaryContainer: Color(0xffbbf0b5),
  tertiary: Color(0xffa3cddb),
  onTertiary: Color(0xff023640),
  tertiaryContainer: Color(0xff214c57),
  onTertiaryContainer: Color(0xffbeeaf7),
  error: Color(0xffffb3b1),
  onError: Color(0xff571d1e),
  errorContainer: Color(0xff733333),
  onErrorContainer: Color(0xffffdad8),
  surface: Color(0xff101510),
  onSurface: Color(0xffe0e4dc),
  onSurfaceVariant: Color(0xffbec8ca),
  outline: Color(0xff899294),
  outlineVariant: Color(0xff3f484a),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xffe0e4dc),
  inversePrimary: Color(0xff2c6a45),
  primaryFixed: Color(0xffb0f1c3),
  onPrimaryFixed: Color(0xff00210f),
  primaryFixedDim: Color(0xff94d5a8),
  onPrimaryFixedVariant: Color(0xff0e512f),
  secondaryFixed: Color(0xffbbf0b5),
  onSecondaryFixed: Color(0xff002105),
  secondaryFixedDim: Color(0xffa0d49b),
  onSecondaryFixedVariant: Color(0xff225025),
  tertiaryFixed: Color(0xffbeeaf7),
  onTertiaryFixed: Color(0xff001f26),
  tertiaryFixedDim: Color(0xffa3cddb),
  onTertiaryFixedVariant: Color(0xff214c57),
  surfaceDim: Color(0xff101510),
  surfaceBright: Color(0xff363a35),
  surfaceContainerLowest: Color(0xff0b0f0b),
  surfaceContainerLow: Color(0xff181d18),
  surfaceContainer: Color(0xff1c211c),
  surfaceContainerHigh: Color(0xff262b26),
  surfaceContainerHighest: Color(0xff313631),
);

const List<Color> categoriesColors = [
  Colors.blue,
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.indigo,
  Colors.lightBlue,
  Colors.cyan,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
];
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
class GradientLightColor {}

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
  outlineVariant: Color(0xffbec8ca),
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

class GradientColor extends ThemeExtension<GradientColor> {
  /// disabled color used when some thing don't used at all ,like [bottom], [card] , ... etc
  /// it's begin [Alignment.bottomCenter] and end [Alignment.topRight]
  /// we used colors [onSurfaceVariant], [outlineVariant]
  final LinearGradient? fixedDisabledColor;

  /// primary color used in any thing like [bottom], [card] , ... etc
  /// it's begin [Alignment.bottomCenter] and end [Alignment.topRight]
  /// we used colors [onTertiaryFixed], [onPrimaryFixedVariant]
  final LinearGradient? fixedPrimaryColor;

  /// secondary color used in any thing like [bottom], [card] , ... etc
  /// it's begin [Alignment.bottomCenter] and end [Alignment.topRight]
  /// we used colors [secondaryFixedDim], [surface]
  final LinearGradient? fixedSecondaryColor;

  /// background color used only onboarding screen
  /// it's begin [Alignment.centerRight] and end [Alignment.bottomLeft]
  /// we used colors [inversePrimary], [primary]
  final LinearGradient? backgroundColor;

  /// card color used in [cards] at home screen
  /// it's begin [Alignment.bottomLeft] and end [Alignment.topRight]
  /// we used colors [secondaryContainer], [onSecondary]
  final LinearGradient? cardColor;

  /// float color used in [FloatingActionButton] at home screen
  /// it's begin [Alignment.bottomCenter] and end [Alignment.topRight]
  /// we used colors [onTertiaryFixed], [onPrimaryFixedVariant]
  final LinearGradient? floatColor;

  GradientColor({
    required this.fixedDisabledColor,
    required this.fixedPrimaryColor,
    required this.fixedSecondaryColor,
    required this.backgroundColor,
    required this.cardColor,
    required this.floatColor,
  });

  @override
  ThemeExtension<GradientColor> copyWith({
    LinearGradient? fixedDisabledColor,
    LinearGradient? fixedPrimaryColor,
    LinearGradient? secondaryColor,
    LinearGradient? backgroundColor,
    LinearGradient? cardColor,
    LinearGradient? floatColor,
    Color? backgroundVariant,
    Color? bms,
    Gradient? pinkGradient,
  }) {
    return GradientColor(
      fixedDisabledColor: fixedDisabledColor ?? this.fixedDisabledColor,
      fixedPrimaryColor: fixedPrimaryColor ?? this.fixedPrimaryColor,
      fixedSecondaryColor: secondaryColor ?? this.fixedSecondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      cardColor: cardColor ?? this.cardColor,
      floatColor: floatColor ?? this.floatColor,
    );
  }

  @override
  ThemeExtension<GradientColor> lerp(
      ThemeExtension<GradientColor>? other, double t) {
    if (other is! GradientColor) {
      return this;
    }
    return GradientColor(
      fixedDisabledColor:
          LinearGradient.lerp(fixedDisabledColor, other.fixedDisabledColor, t),
      fixedPrimaryColor:
          LinearGradient.lerp(fixedPrimaryColor, other.fixedPrimaryColor, t),
      fixedSecondaryColor: LinearGradient.lerp(
          fixedSecondaryColor, other.fixedSecondaryColor, t),
      backgroundColor:
          LinearGradient.lerp(backgroundColor, other.backgroundColor, t),
      cardColor: LinearGradient.lerp(cardColor, other.cardColor, t),
      floatColor: LinearGradient.lerp(floatColor, other.floatColor, t),
    );
  }
}

final lightGradient = GradientColor(
  fixedDisabledColor: LinearGradient(
    colors: [
      lightColorScheme.onSurfaceVariant,
      lightColorScheme.outlineVariant,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  ),
  fixedPrimaryColor: LinearGradient(
    colors: [
      lightColorScheme.onTertiaryFixed,
      lightColorScheme.onPrimaryFixedVariant.withGreen(150),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  ),
  fixedSecondaryColor: LinearGradient(
    colors: [
      lightColorScheme.secondaryFixedDim,
      lightColorScheme.surface,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  ),
  backgroundColor: LinearGradient(
    colors: [
      lightColorScheme.inversePrimary,
      lightColorScheme.primary,
    ],
    begin: Alignment.centerRight,
    end: Alignment.bottomLeft,
  ),
  cardColor: LinearGradient(
    colors: [
      lightColorScheme.secondaryContainer,
      lightColorScheme.onSecondary,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  floatColor: LinearGradient(
    colors: [
      lightColorScheme.onTertiaryFixed.withOpacity(0.75),
      lightColorScheme.onPrimaryFixedVariant.withGreen(150).withOpacity(0.6),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  ),
);

final darkGradient = GradientColor(
  fixedDisabledColor: LinearGradient(
    colors: [
      lightColorScheme.onSurfaceVariant,
      lightColorScheme.outlineVariant,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  ),
  fixedPrimaryColor: LinearGradient(
    colors: [
      darkColorScheme.onTertiaryFixed,
      darkColorScheme.onPrimaryFixedVariant.withGreen(150),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  ),
  fixedSecondaryColor: LinearGradient(
    colors: [
      darkColorScheme.secondaryFixedDim,
      lightColorScheme.surface,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  ),
  backgroundColor: LinearGradient(
    colors: [
      darkColorScheme.inversePrimary,
      darkColorScheme.primary,
    ],
    begin: Alignment.centerRight,
    end: Alignment.bottomLeft,
  ),
  cardColor: LinearGradient(
    colors: [
      darkColorScheme.secondaryContainer,
      darkColorScheme.onSecondary,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  floatColor: LinearGradient(
    colors: [
      darkColorScheme.onTertiaryFixed.withOpacity(0.75),
      darkColorScheme.onPrimaryFixedVariant.withGreen(150).withOpacity(0.6),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  ),
);

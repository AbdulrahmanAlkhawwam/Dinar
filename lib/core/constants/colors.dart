import 'package:flutter/material.dart';

/// LIGHT MODE COLOR
///
///
/// COLOR THEME : [lightColorScheme] , but it's only for light THEME
/// it it's created by [Material.io] which you can visited it in this link
/// [https://amaterial-foundation.github.io/material-theme-builder/]
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: Color(0xff68E571),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffBFFFC4),
  onPrimaryContainer: Color(0xff19361B),

  secondary: Color(0xff00B380),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xff99F0D7),
  onSecondaryContainer: Color(0xff004531),

  tertiary: Color(0xff008091),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffB2F6FF),
  onTertiaryContainer: Color(0xff1A3D41),

  error: Color(0xffBA1A1A),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffFFDAD6),
  onErrorContainer: Color(0xff320405),

  onSurface: Color(0xff0B3A3C),
  surface: Color(0xffEFFFEF),
  outline: Color(0xff73796E),
  outlineVariant: Color(0xff43483F),

  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
);

/// LINEAR GRADIENT class : [GradientLightColor]
class GradientLightColor {}

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  primary: Color(0xff68E571),
  onPrimary: Color(0xFF000000),
  primaryContainer: Color(0xff255928),
  onPrimaryContainer: Color(0xffBFFFC4),

  secondary: Color(0xff00B380),
  onSecondary: Color(0xFF000000),
  secondaryContainer: Color(0xff99F0D7),
  onSecondaryContainer: Color(0xff004531),

  tertiary: Color(0xff008091),
  onTertiary: Color(0xFF000000),
  tertiaryContainer: Color(0xff1A3D41),
  onTertiaryContainer: Color(0xffB2F6FF),

  error: Color(0xffe64646),
  onError: Color(0xFF000000),
  errorContainer: Color(0xff680c0e),
  onErrorContainer: Color(0xffFFDAD6),

  onSurface: Color(0xffEFFFEF),
  surface: Color(0xff0B3A3C),
  outline: Color(0xff73796E),
  outlineVariant: Color(0xff43483F),

  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
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
  /// we used colors [primary], [onPrimaryFixedVariant]
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
    LinearGradient? fixedSecondaryColor,
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
      fixedSecondaryColor: fixedSecondaryColor ?? this.fixedSecondaryColor,
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
      lightColorScheme.outlineVariant,
      lightColorScheme.outline,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  fixedPrimaryColor: LinearGradient(
    colors: [
      lightColorScheme.primary,
      lightColorScheme.tertiary,
    ],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  ),
  fixedSecondaryColor: LinearGradient(
    colors: [
      lightColorScheme.primary,
      lightColorScheme.secondary,
    ],
    begin: Alignment.bottomLeft,
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
      lightColorScheme.primary,
      lightColorScheme.tertiaryContainer,
    ],
    begin: Alignment.bottomLeft,
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

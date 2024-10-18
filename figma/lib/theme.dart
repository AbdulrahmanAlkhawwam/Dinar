import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  // onPrimary // onSecondary // onTertiary // onError
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff416834),
      surfaceTint: Color(0xff416834),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffc2efae),
      onPrimaryContainer: Color(0xff032100),
      secondary: Color(0xff54624d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd7e7cc),
      onSecondaryContainer: Color(0xff121f0e),
      tertiary: Color(0xff386668),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbcebed),
      onTertiaryContainer: Color(0xff002021),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff8faf0),
      onSurface: Color(0xff191d17),
      onSurfaceVariant: Color(0xff43483f),
      outline: Color(0xff73796e),
      outlineVariant: Color(0xffc3c8bc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e322b),
      inversePrimary: Color(0xffa7d394),
      primaryFixed: Color(0xffc2efae),
      onPrimaryFixed: Color(0xff032100),
      primaryFixedDim: Color(0xffa7d394),
      onPrimaryFixedVariant: Color(0xff2a4f1f),
      secondaryFixed: Color(0xffd7e7cc),
      onSecondaryFixed: Color(0xff121f0e),
      secondaryFixedDim: Color(0xffbccbb1),
      onSecondaryFixedVariant: Color(0xff3d4b36),
      tertiaryFixed: Color(0xffbcebed),
      onTertiaryFixed: Color(0xff002021),
      tertiaryFixedDim: Color(0xffa0cfd1),
      onTertiaryFixedVariant: Color(0xff1e4e50),
      surfaceDim: Color(0xffd8dbd1),
      surfaceBright: Color(0xfff8faf0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f5eb),
      surfaceContainer: Color(0xffecefe5),
      surfaceContainerHigh: Color(0xffe7e9df),
      surfaceContainerHighest: Color(0xffe1e4da),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa7d394),
      surfaceTint: Color(0xffa7d394),
      onPrimary: Color(0xff13380a),
      primaryContainer: Color(0xff2a4f1f),
      onPrimaryContainer: Color(0xffc2efae),
      secondary: Color(0xffbccbb1),
      onSecondary: Color(0xff273421),
      secondaryContainer: Color(0xff3d4b36),
      onSecondaryContainer: Color(0xffd7e7cc),
      tertiary: Color(0xffa0cfd1),
      onTertiary: Color(0xff003739),
      tertiaryContainer: Color(0xff1e4e50),
      onTertiaryContainer: Color(0xffbcebed),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff11140f),
      onSurface: Color(0xffe1e4da),
      onSurfaceVariant: Color(0xffc3c8bc),
      outline: Color(0xff8d9387),
      outlineVariant: Color(0xff43483f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e4da),
      inversePrimary: Color(0xff416834),
      primaryFixed: Color(0xffc2efae),
      onPrimaryFixed: Color(0xff032100),
      primaryFixedDim: Color(0xffa7d394),
      onPrimaryFixedVariant: Color(0xff2a4f1f),
      secondaryFixed: Color(0xffd7e7cc),
      onSecondaryFixed: Color(0xff121f0e),
      secondaryFixedDim: Color(0xffbccbb1),
      onSecondaryFixedVariant: Color(0xff3d4b36),
      tertiaryFixed: Color(0xffbcebed),
      onTertiaryFixed: Color(0xff002021),
      tertiaryFixedDim: Color(0xffa0cfd1),
      onTertiaryFixedVariant: Color(0xff1e4e50),
      surfaceDim: Color(0xff11140f),
      surfaceBright: Color(0xff373a34),
      surfaceContainerLowest: Color(0xff0c0f0a),
      surfaceContainerLow: Color(0xff191d17),
      surfaceContainer: Color(0xff1d211b),
      surfaceContainerHigh: Color(0xff272b25),
      surfaceContainerHighest: Color(0xff32362f),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

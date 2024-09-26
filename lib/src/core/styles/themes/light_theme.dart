import 'package:flutter/material.dart';
import '../colors/light_colors.dart';

ThemeData lightTheme = ThemeData(
    iconButtonTheme:const  IconButtonThemeData(
  style: ButtonStyle(
    // foregroundColor: WidgetStatePropertyAll(
    // LightColors.lightScheme.onSurface,
    // ),
    fixedSize: WidgetStatePropertyAll(
      Size(24, 24),
    ),
  ),
));

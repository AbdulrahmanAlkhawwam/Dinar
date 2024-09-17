import '../colors/main_colors.dart';
import 'package:flutter/material.dart';

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
}

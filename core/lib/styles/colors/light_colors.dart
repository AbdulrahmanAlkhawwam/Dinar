import '../colors/main_colors.dart';
import 'package:flutter/material.dart';

class LightColors {
  // for next button
  static LinearGradient darkButtonColorEnabled = LinearGradient(
    colors: [
      MainColors.darkTeal,
      MainColors.forestGreen,
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  );
  static LinearGradient darkButtonColorDisabled = LinearGradient(
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
}

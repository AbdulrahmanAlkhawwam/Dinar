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
}

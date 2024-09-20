import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';

import '../../../../core/styles/colors/main_colors.dart';

class OnboardingTitle extends StatelessWidget {
  const OnboardingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Let’s\n Your",
          style: TextStyle(
            color: MainColors.darkTeal,
            fontSize: 35,
          ),
        ),
        GradientText(
          const Text(
            "Manage\n Money",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          colors: [
            MainColors.darkTeal,
            MainColors.forestGreen,
          ],
        ),
      ],
    );
  }
}

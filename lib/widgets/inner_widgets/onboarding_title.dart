import 'package:core/styles/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';

class OnboardingTitle extends StatelessWidget {
  const OnboardingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Let’s\n",
                style: TextStyle(
                  color: MainColors.darkTeal,
                  fontSize: 35,
                ),
              ),
              TextSpan(
                text: "Your",
                style: TextStyle(
                  color: MainColors.darkTeal,
                  fontSize: 35,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        GradientText(
          const Text(
            " Manage\n Money",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          type: Type.linear,
          colors: [
            MainColors.darkTeal,
            MainColors.forestGreen,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ],
    );
  }
}

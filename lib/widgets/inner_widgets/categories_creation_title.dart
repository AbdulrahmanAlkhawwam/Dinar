import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:core/styles/colors/main_colors.dart';
import 'package:flutter/material.dart';

class CategoriesCreationTitle extends StatelessWidget {
  const CategoriesCreationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "create your",
          style: TextStyle(
            color: MainColors.darkTeal,
            fontSize: 35,
          ),
        ),
        GradientText(
          const Text(
            "Categories",
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
    );;
  }
}

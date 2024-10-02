import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors/main_colors.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({
    super.key,
    required this.title,
  });

  // final Kind? kind;

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
          Text(
            /* kind != Kind.wallet*/
            true ? "Categories" : "Wallets",
            style: const TextStyle(
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

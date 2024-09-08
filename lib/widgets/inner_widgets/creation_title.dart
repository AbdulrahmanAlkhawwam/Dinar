import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:core/styles/colors/main_colors.dart';
import 'package:flutter/material.dart';
import '../../models/kind.dart';

class CreationTitle extends StatelessWidget {
  const CreationTitle({super.key, required this.kind});

  final Kind kind;

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
            kind != Kind.wallet ? "Categories" : "Wallets",
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

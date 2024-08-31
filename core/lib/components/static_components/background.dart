import 'package:core/styles/colors/light_colors.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LightColors.backgroundColor,
      ),
    );
  }
}

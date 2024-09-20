import 'package:flutter/material.dart';

import '../../../../core/styles/colors/light_colors.dart';
import '../../../../core/styles/colors/main_colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LightColors.backgroundColor,
            ),
          ),
          Center(
            child: LinearProgressIndicator(
              minHeight: MediaQuery.of(context).size.height,
              color: MainColors.darkTeal.withOpacity(0.1),
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

import 'screen.dart';
import '../styles/colors/main_colors.dart';

import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    print ("we are in loading screen");
    return Screen(
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: LinearProgressIndicator(
              minHeight: MediaQuery.of(context).size.height,
              color: MainColors.darkTeal.withOpacity(0.1),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}

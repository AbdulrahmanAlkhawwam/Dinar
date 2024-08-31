import 'package:core/components/dynamic_components/primary_button.dart';
import 'package:core/components/static_components/screen.dart';
import 'package:flutter/material.dart';

import '../widgets/inner_widgets/onboarding_title.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Spacer(),
                      OnboardingTitle(),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: PrimaryButton(onPressed: (){}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

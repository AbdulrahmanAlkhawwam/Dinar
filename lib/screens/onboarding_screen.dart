import 'package:core/components/dynamic_components/primary_button.dart';
import 'package:core/components/static_components/screen.dart';
import '../widgets/inner_widgets/onboarding_title.dart';

import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Spacer(),
                    OnboardingTitle(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: PrimaryButton(
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import '../../../onboarding/presentation/pages/creation_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/components/widgets/screen.dart';
import '../widgets/onboarding_title.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("we are in onboarding screen");
    return Screen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const CreationScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

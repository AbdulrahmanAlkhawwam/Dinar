import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:flutter/material.dart';

import 'creation_screen.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/components/widgets/screen.dart';
import '../../../../core/components/buttons/primary_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Let’s\n Your",
                          style: TextStyle(
                            color: context.colors.onTertiaryFixed,
                            fontSize: 35,
                          ),
                        ),
                        GradientText(
                          const Text(
                            "Manage\n Money",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          colors: [
                            context.colors.onTertiaryFixed,
                            context.colors.onPrimaryFixedVariant
                                .withOpacity(0.75),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: PrimaryButton(
                  onPressed: () => context.push(
                    MaterialPageRoute(
                      builder: (context) => CreationScreen(title: "Category"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

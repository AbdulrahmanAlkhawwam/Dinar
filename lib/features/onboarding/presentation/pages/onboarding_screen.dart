import 'package:flutter/material.dart';

import '../../../../core/constants/res.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/components/buttons/primary_button.dart';
import './creation_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBFDE3),
      body: Stack(
        children: [
          Image.asset(Res.onboarding),
          Padding(
            padding:
                EdgeInsets.fromLTRB(32, 32, 32, 48 + context.bottomPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  texts["onboarding"]["title"] ?? texts["error_msg"],
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colors.onSurface,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    textAlign: TextAlign.center,
                    texts["onboarding"]["description"] ??
                        texts["error_msg"],
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.secondary,
                    ),
                  ),
                ),
                PrimaryButton(
                  text: texts["onboarding"]["button"] ?? texts["e_msg"],
                  onPressed: () => context.pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          CreationScreen(title: texts["app"]["cat_type"]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

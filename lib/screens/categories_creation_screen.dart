import 'package:Dinar/widgets/inner_widgets/categories_creation_title.dart';
import 'package:core/components/dynamic_components/primary_button.dart';
import 'package:core/components/dynamic_components/secondary_button.dart';
import 'package:core/components/static_components/screen.dart';
import 'package:core/styles/colors/main_colors.dart';
import '../widgets/independent_widgets/categories_bottom_sheet.dart';
import '../widgets/inner_widgets/onboarding_title.dart';

import 'package:flutter/material.dart';

class CategoriesCreationScreen extends StatelessWidget {
  const CategoriesCreationScreen({super.key});

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
                    CategoriesCreationTitle(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    PrimaryButton(
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SecondaryButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => CategoriesBottomSheet(),
                          backgroundColor: MainColors.mintCream,
                          isScrollControlled: true,
                          useSafeArea: true,

                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

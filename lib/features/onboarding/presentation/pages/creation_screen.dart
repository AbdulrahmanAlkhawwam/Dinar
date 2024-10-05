import 'package:Dinar/features/categories/presentation/manager/categories_bloc.dart';
import 'package:Dinar/features/home/presentation/pages/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';

import '../widgets/check_bottom_sheet.dart';
import '../../../wallets/domain/entities/wallet.dart';
import '../../../app/presentation/manager/general/general_bloc.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../categories/presentation/widgets/categories_bottom_sheet.dart';
import '../../../wallets/presentation/widgets/wallets_bottom_sheet.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/components/widgets/screen.dart';
import '../../../../core/styles/colors/main_colors.dart';
import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/components/buttons/secondary_button.dart';

class CreationScreen extends StatefulWidget {
  final String title;

  const CreationScreen({
    super.key,
    required this.title,
  });

  @override
  State<CreationScreen> createState() => _CreationScreenState();
}

class _CreationScreenState extends State<CreationScreen> {
  bool isEnabled = false;

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
                padding: EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      "create your",
                      style: TextStyle(
                        color: MainColors.darkTeal,
                        fontSize: 35,
                      ),
                    ),
                    GradientText(
                      Text(
                        widget.title,
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
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    PrimaryButton(
                      onPressed: !isEnabled
                          ? null
                          : () => widget.title == "Category"
                              ? context.push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CreationScreen(title: "Wallets"),
                                  ),
                                )
                              : context.push(
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                ),
                    ),
                    const SizedBox(height: 16),
                    SecondaryButton(
                      onPressed: () async {
                        Object object = await showModalBottomSheet(
                          context: context,
                          builder: (context) => widget.title == "Category"
                              ? CategoriesBottomSheet()
                              : WalletsBottomSheet(),
                          sheetAnimationStyle: AnimationStyle(
                            duration: const Duration(milliseconds: 750),
                            reverseDuration: const Duration(milliseconds: 750),
                            curve: Curves.easeInSine,
                            reverseCurve: Curves.easeOutSine,
                          ),
                          backgroundColor: MainColors.mintCream,
                          isScrollControlled: true,
                          useSafeArea: true,
                        );
                        bool checked = await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CheckBottomSheet(
                              type: widget.title,
                              category: widget.title == "Category"
                                  ? object as Category
                                  : null,
                              wallet: widget.title != "Category"
                                  ? object as Wallet
                                  : null,
                            );
                          },
                          sheetAnimationStyle: AnimationStyle(
                            duration: const Duration(milliseconds: 750),
                            reverseDuration: const Duration(milliseconds: 750),
                            curve: Curves.easeInSine,
                            reverseCurve: Curves.easeOutSine,
                          ),
                          backgroundColor: MainColors.mintCream,
                          isScrollControlled: true,
                          useSafeArea: true,
                        );
                        if (checked) {
                          if (widget.title == "Category") {
                            context.read<CategoriesBloc>().add(
                                  AddCategoryEvent(
                                    category: object as Category,
                                  ),
                                );
                          } else {
                            context.read<GeneralBloc>().add(
                                  AddWalletEvent(
                                    wallet: object as Wallet,
                                  ),
                                );
                          }
                          setState(() => isEnabled = true);
                        }
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

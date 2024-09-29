import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/widgets/screen.dart';
import '../../../wallets/domain/entities/wallet.dart';
import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/components/buttons/secondary_button.dart';
import '../../../../core/styles/colors/main_colors.dart';
import '../../../app/presentation/manager/general/general_bloc.dart';
import '../../../app/presentation/pages/management_screen.dart';

import '../../../categories/domain/entities/category.dart';

// import '../../../../../models/kind.dart';
import '../../../categories/presentation/widgets/categories_bottom_sheet.dart';

import '../../../wallets/presentation/widgets/wallets_bottom_sheet.dart';
import '../widgets/check_bottom_sheet.dart';
import '../widgets/creation_title.dart';

class CreationScreen extends StatefulWidget {
  const CreationScreen({super.key});

  @override
  State<CreationScreen> createState() => _CreationScreenState();
}

class _CreationScreenState extends State<CreationScreen> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    print("we are in creation screen");

    // final Kind kind = context
    //     .read<GeneralBloc>()
    //     .kind;

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
                    CreationTitle(),
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
                      onPressed: !isEnabled
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => const ManagementScreen(),
                                ),
                              );
                            },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SecondaryButton(
                      onPressed: () async {
                        Object object = await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return /* kind != Kind.wallet*/ true
                                ? CategoriesBottomSheet()
                                : WalletsBottomSheet();
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
                        bool checked = await showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CheckBottomSheet(
                              type: /* kind != Kind.wallet*/
                                  true ? "category" : "wallet",
                              category: /*kind != Kind.wallet*/
                                  true ? object as Category : null,
                              wallet: /*kind == Kind.wallet*/
                                  true ? object as Wallet : null,
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
                          setState(() {
                            isEnabled = true;
                          });
                          if (/*kind != Kind.wallet*/ true) {
                            BlocProvider.of<GeneralBloc>(context).add(
                              AddCategoryEvent(
                                category: object as Category,
                              ),
                            );
                          } else {
                            BlocProvider.of<GeneralBloc>(context).add(
                              AddWalletEvent(
                                wallet: object as Wallet,
                              ),
                            );
                          }
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

import 'package:Dinar/manager/general/general_bloc.dart';
import 'package:Dinar/models/wallet.dart';
import 'package:Dinar/screens/management_screen.dart';
import 'package:Dinar/widgets/independent_widgets/check_bottom_sheet.dart';
import 'package:Dinar/widgets/inner_widgets/creation_title.dart';
import 'package:core/components/dynamic_components/primary_button.dart';
import 'package:core/components/dynamic_components/secondary_button.dart';
import 'package:core/components/static_components/loading.dart';
import 'package:core/components/static_components/screen.dart';
import 'package:core/styles/colors/main_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/category.dart';
import '../models/kind.dart';
import '../widgets/independent_widgets/categories_bottom_sheet.dart';

import 'package:flutter/material.dart';

import '../widgets/independent_widgets/wallets_bottom_sheet.dart';

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

    final Kind kind = context
        .read<GeneralBloc>()
        .kind;
    return BlocBuilder<GeneralBloc, GeneralState>(
      builder: (context, state) {
        switch (state) {
          case LoadingState _:
            return const Loading();
          case ErrorState _:
            return Screen(
              child: Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.error,
                        size: 75,
                      ),
                      Text(state.message)
                    ],
                  ),
                ),
              ),
            );
          default:
            return Screen(
              child: Scaffold(
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
                            CreationTitle(
                              kind: kind,
                            ),
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
                              onPressed: !isEnabled ? null
                                  : () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) =>
                                    const ManagementScreen(),
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
                                    return kind != Kind.wallet
                                        ? CategoriesBottomSheet()
                                        : WalletsBottomSheet();
                                  },
                                  sheetAnimationStyle: AnimationStyle(
                                    duration: const Duration(milliseconds: 750),
                                    reverseDuration:
                                    const Duration(milliseconds: 750),
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
                                      type: kind != Kind.wallet
                                          ? "category"
                                          : "wallet",
                                      category: kind != Kind.wallet
                                          ? object as Category
                                          : null,
                                      wallet: kind == Kind.wallet
                                          ? object as Wallet
                                          : null,
                                    );
                                  },
                                  sheetAnimationStyle: AnimationStyle(
                                    duration: const Duration(milliseconds: 750),
                                    reverseDuration:
                                    const Duration(milliseconds: 750),
                                    curve: Curves.easeInSine,
                                    reverseCurve: Curves.easeOutSine,
                                  ),
                                  backgroundColor: MainColors.mintCream,
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                );
                                if (checked) {
                                  setState(() {
                                    isEnabled = true ;
                                  });
                                  if (kind != Kind.wallet) {
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
      },
    );
  }
}

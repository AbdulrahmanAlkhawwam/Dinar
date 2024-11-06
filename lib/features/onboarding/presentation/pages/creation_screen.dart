import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/components/buttons/secondary_button.dart';
import '../../../../core/components/widgets/sheet.dart';
import '../../../../core/constants/res.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/utils/app_context.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../categories/presentation/manager/categories_bloc.dart';
import '../../../categories/presentation/widgets/categories_bottom_sheet.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../wallets/domain/entities/wallet.dart';
import '../../../wallets/presentation/manager/bloc/wallets_bloc.dart';
import '../../../wallets/presentation/widgets/wallets_bottom_sheet.dart';
import '../widgets/add_check_bottom_sheet.dart';

class CreationScreen extends StatefulWidget {
  final String title;

  const CreationScreen({super.key, required this.title});

  @override
  State<CreationScreen> createState() => _CreationScreenState();
}

class _CreationScreenState extends State<CreationScreen> {
  bool _isEnabled = false;
  bool? checked = false;
  Category? category;
  Wallet? wallet;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WalletsBloc, WalletsState>(
          listener: (context, state) {
            if (state is WalletAdded) {
              setState(() => _isEnabled = true);
            }
          },
        ),
        BlocListener<CategoriesBloc, CategoriesState>(
          listener: (context, state) {
            if (state is CategoryAdded) {
              setState(() => _isEnabled = true);
            }
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Color(0xFFEBFDE3),
            body: Stack(
              children: [
                Column(
                  children: [Image.asset(Res.onboarding, fit: BoxFit.fitWidth)],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      32, 32, 32, 48 + context.bottomPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        texts[widget.title]["title"] ?? texts["error_msg"],
                        style: context.textTheme.titleMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 32,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          texts[widget.title]["creation"]["description"] ??
                              texts["error_msg"],
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.secondary,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SecondaryButton(
                              text: texts["creation"]["sec_button"] ??
                                  texts["e_msg"],
                              onPressed: () async {
                                widget.title == texts["app"]["cat_type"]
                                    ? category = await sheet(
                                        context: context,
                                        content: CategoriesBottomSheet())
                                    : wallet = await sheet(
                                        context: context,
                                        content: WalletsBottomSheet());

                                if (wallet != null || category != null) {
                                  checked = await sheet(
                                    context: context,
                                    content: AddCheckBottomSheet(
                                      type: widget.title,
                                      category: widget.title ==
                                              texts["app"]["cat_type"]
                                          ? category
                                          : null,
                                      wallet: widget.title ==
                                              texts["app"]["wal_type"]
                                          ? wallet
                                          : null,
                                    ),
                                  );
                                }
                                if (checked!) {
                                  if (widget.title ==
                                          texts["app"]["cat_type"] &&
                                      category != null) {
                                    context.read<CategoriesBloc>().add(
                                          AddCategoryEvent(
                                            category: category as Category,
                                          ),
                                        );
                                  } else if (wallet != null) {
                                    context.read<WalletsBloc>().add(
                                          AddWalletEvent(
                                            wallet: wallet as Wallet,
                                          ),
                                        );
                                  } else {
                                    // this should not be
                                  }
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: PrimaryButton(
                              text: texts["creation"]["pri_button"] ??
                                  texts["e_msg"],
                              massage: "You should add new ${widget.title}",
                              onPressed: !_isEnabled
                                  ? null
                                  : () => widget.title ==
                                          texts["app"]["cat_type"]
                                      ? context.pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CreationScreen(
                                              title: texts["app"]["wal_type"],
                                            ),
                                          ),
                                        )
                                      : context.pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ),
                                        ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

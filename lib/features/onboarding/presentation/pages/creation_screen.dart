import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../widgets/add_check_bottom_sheet.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../wallets/domain/entities/wallet.dart';
import '../../../wallets/presentation/manager/wallets_bloc.dart';
import '../../../wallets/presentation/widgets/wallets_bottom_sheet.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../categories/presentation/manager/categories_bloc.dart';
import '../../../categories/presentation/widgets/categories_bottom_sheet.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/components/widgets/sheet.dart';
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
  bool _isEnabled = false;
  bool _isdefault = false;
  Category? category;
  Wallet? wallet;
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CategoriesBloc, CategoriesState>(
          listener: (context, state) {
            if (state is CategoriesError) {
              context.showErrorSnackBar(massage: state.message.value);
            }
            if (state is CategoryAdded) {
              setState(() => _isEnabled = true);
              context.showSuccessSnackBar(
                  massage: "Add new ${widget.title} Successfully");
            }
          },
        ),
        BlocListener<WalletsBloc, WalletsState>(
          listener: (context, state) {
            if (state is WalletsError) {
              context.showErrorSnackBar(massage: state.message.value);
            }
            if (state is WalletAdded) {
              setState(() => _isEnabled = true);
              context.showSuccessSnackBar(
                  massage: "Add new ${widget.title} Successfully");
              if (_isdefault) {
                ScaffoldMessenger.of(context).clearSnackBars();
                context.pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              }
            }
          },
        ),
      ],
      child: Builder(builder: (context) {
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
                          massage: "You should add new ${widget.title}",
                          onPressed: !_isEnabled
                              ? widget.title == "Wallets"
                                  ? () {
                                      context.read<WalletsBloc>().add(
                                            AddWalletEvent(
                                              wallet: Wallet(name: "user"),
                                            ),
                                          );
                                      setState(() => _isdefault = true);
                                    }
                                  : null
                              : () => widget.title == "Category"
                                  ? context.pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            CreationScreen(title: "Wallets"),
                                      ),
                                    )
                                  : context.pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    ),
                        ),
                        const SizedBox(height: 16),
                        SecondaryButton(
                          onPressed: () async {
                            widget.title == "Category"
                                ? category = await sheet(
                                    context: context,
                                    content: CategoriesBottomSheet(),
                                  ) as Category
                                : wallet = await sheet(
                                    context: context,
                                    content: WalletsBottomSheet()) as Wallet;
                            if (wallet != null || category != null) {
                              checked = await sheet(
                                context: context,
                                content: AddCheckBottomSheet(
                                  type: widget.title,
                                  category: widget.title == "Category"
                                      ? category
                                      : null,
                                  wallet: widget.title != "Category"
                                      ? wallet
                                      : null,
                                ),
                              ) as bool;
                            }
                            if (checked) {
                              if (widget.title == "Category" &&
                                  category != null) {
                                context.read<CategoriesBloc>().add(
                                      AddCategoryEvent(
                                        category: category ??
                                            Category(
                                              name: "",
                                              type: OperationType.income,
                                            ),
                                      ),
                                    );
                              } else if (wallet != null) {
                                context.read<WalletsBloc>().add(
                                      AddWalletEvent(
                                        wallet: wallet ??
                                            Wallet(
                                              id: "",
                                              name: "",
                                            ),
                                      ),
                                    );
                              } else {
                                context.showErrorSnackBar(
                                    massage: "Value not valid !");
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
      }),
    );
  }
}

Wallet? wallet;

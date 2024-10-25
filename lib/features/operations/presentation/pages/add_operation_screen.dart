import 'dart:developer';

import 'package:Dinar/features/home/presentation/pages/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/buttons/menu_button.dart';
import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/components/buttons/secondary_button.dart';
import '../../../../core/components/dialog/date_dialog.dart';
import '../../../../core/components/inters/input_field.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/utils/app_context.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../categories/presentation/manager/categories_bloc.dart';
import '../../../wallets/domain/entities/wallet.dart';
import '../../../wallets/presentation/manager/wallets_bloc.dart';
import '../../domain/entities/operation.dart';
import '../manager/operation_bloc.dart';

class AddOperationScreen extends StatefulWidget {
  const AddOperationScreen({
    super.key,
    required this.type,
  });

  final OperationType type;

  @override
  State<AddOperationScreen> createState() => _AddOperationScreenState();
}

class _AddOperationScreenState extends State<AddOperationScreen> {
  final nameController = TextEditingController();
  final valueController = TextEditingController();
  final descriptionController = TextEditingController();
  final globalKey = GlobalKey<FormState>();

  Category? selectedCategory;
  Wallet? selectedWallet;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final categoryMenu = widget.type == OperationType.income
        ? context.read<CategoriesBloc>().incomeCategories
        : context.read<CategoriesBloc>().paymentCategories;
    final walletMenu = context.read<WalletsBloc>().wallets;

    return BlocListener<OperationBloc, OperationState>(
      listener: (context, state) {
        // if (state is OperationLoading) {
        // context.loaderOverlay.show();
        // } else {
        // context.loaderOverlay.hide();
        // }
        if (state is OperationAdded) {
          context.pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        }
        if (state is OperationError) {
          context.showErrorSnackBar(massage: state.message.value);
        }
      },
      child: Scaffold(
        body: Padding(
          // TODO : you should fix padding , when you open keyboard
          padding: EdgeInsets.fromLTRB(24, 32, 24, 32),
          child: Form(
            key: globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Add new",
                      style: context.textTheme.bodyMedium,
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => context.pop(),
                    )
                  ],
                ),
                GradientText(
                  Text(
                    widget.type.name.toUpperCase(),
                    style: context.textTheme.titleLarge,
                  ),
                  colors: [
                    context.colors.onSurface,
                    widget.type == OperationType.income
                        ? context.colors.primary
                        : context.colors.error,
                  ],
                ),
                const SizedBox(height: 40),
                InputField(
                  isEnabled: true,
                  hint: "Name",
                  controller: nameController,
                  validator: (value) {
                    if (value == "" || value.trim() == "") {
                      return "Name must not be empty";
                    } else if (double.tryParse(value) != null) {
                      return "Name must consist of letters";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                InputField(
                  keyboardType: TextInputType.number,
                  isEnabled: true,
                  hint: "Price",
                  validator: (value) {
                    if (value == "" || value.trim() == "") {
                      return "price must not be empty";
                    } else if (double.tryParse(value) == null) {
                      return "price must consist of numbers";
                    }
                    return null;
                  },
                  controller: valueController,
                ),
                const SizedBox(height: 24),
                // InputField(
                //   isEnabled: true,
                //   hint: "Description",
                //   helperText: "not necessary !",
                //   controller: descriptionController,
                // ),
                // const SizedBox(height: 16),
                MenuButton(
                  selected: selectedCategory?.name,
                  text: categoriesTable,
                  menu: categoryMenu.map((category) => category.name).toList(),
                  onTap: (index) => setState(() => selectedCategory =
                      categoryMenu
                          .firstWhere((category) => category.name == index)),
                ),
                const SizedBox(height: 24),
                MenuButton(
                  selected: selectedWallet?.name,
                  text: walletsTable,
                  menu: walletMenu.map((wallet) => wallet.name).toList(),
                  onTap: (index) => setState(() => selectedWallet =
                      walletMenu.firstWhere((wallet) => wallet.name == index)),
                ),
                const SizedBox(height: 24),
                Center(
                  child: SecondaryButton(
                    text: "",
                    onPressed: () async {
                      setState(() {});
                      selectedDate = await showDialog(
                        context: context,
                        builder: (ctx) => DateDialog(),
                      );
                    },
                    child: Text(
                      selectedDate != null
                          ? DateFormat("yyyy-MM-dd").format(selectedDate!)
                          : "Get Time",
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                ),
                const Spacer(),
                Center(
                  child: PrimaryButton(
                    text: "Add",
                    onPressed: () {
                      if (globalKey.currentState!.validate() &&
                          selectedCategory != null &&
                          selectedWallet != null) {
                        context.read<OperationBloc>().add(
                              AddOperationEvent(
                                operation: Operation(
                                  name: nameController.text,
                                  value: double.parse(valueController.text),
                                  description: descriptionController.text,
                                  categoryId: selectedCategory!.id!,
                                  walletId: selectedWallet!.id!,
                                  date: selectedDate ?? DateTime.now(),
                                  category: selectedCategory,
                                  wallet: selectedWallet,
                                  type: widget.type,
                                ),
                              ),
                            );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/buttons/menu_button.dart';
import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/components/buttons/secondary_button.dart';
import '../../../../core/components/dialog/time_dialog.dart';
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

class AddOperationScreen extends StatelessWidget {
  AddOperationScreen({
    super.key,
    this.type,
  });

  OperationType? type;
  final nameController = TextEditingController();
  final valueController = TextEditingController();
  final descriptionController = TextEditingController();
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final categoryMenu = type == OperationType.income
        ? context.read<CategoriesBloc>().incomeCategories
        : context.read<CategoriesBloc>().paymentCategories;
    final walletMenu = context.read<WalletsBloc>().wallets;

    Category? selectedCategory;
    Wallet? selectedWallet;
    DateTime? date;

    return BlocListener<OperationBloc, OperationState>(
      listener: (context, state) {
        if (state is OperationLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
        if (state is OperationAdded) {
          context.pop();
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
                    type?.name.toUpperCase() ?? "Operation",
                    style: context.textTheme.titleLarge,
                  ),
                  colors: [
                    context.colors.onSurface,
                    type == OperationType.income
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
                InputField(
                  isEnabled: true,
                  hint: "Description",
                  helperText: "not necessary !",
                  controller: descriptionController,
                ),
                const SizedBox(height: 16),
                MenuButton(
                  text: categoriesTable,
                  menu: categoryMenu.map((category) => category.name).toList(),
                  onTap: (index) => selectedCategory = categoryMenu
                      .firstWhere((category) => category.name == index),
                ),
                const SizedBox(height: 24),
                MenuButton(
                  text: walletsTable,
                  menu: walletMenu.map((wallet) => wallet.name).toList(),
                  onTap: (index) => selectedWallet = walletMenu.firstWhere(
                    (wallet) => wallet.name == index,
                  ),
                ),
                const SizedBox(height: 24),
                MenuButton(
                  selected: type?.name,
                  text: texts[texts["app"]["cat_type"]]["sheet"]["menu"],
                  menu: OperationType.values
                      .map(
                        (operation) => operation.name,
                      )
                      .toList(),
                  onTap: (value) => type = value == OperationType.income.name
                      ? OperationType.income
                      : OperationType.payment,
                ),
                const SizedBox(height: 24),
                Center(
                  child: SecondaryButton(
                    text: "Get Time",
                    onPressed: () async {
                      TimeOfDay output = await showDialog(
                        context: context,
                        builder: (ctx) => TimeDialog(),
                      );
                      date = DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        output.hour,
                        output.minute,
                      );
                      print(date);
                    },
                  ),
                ),
                const Spacer(),
                Center(
                  child: PrimaryButton(
                    text: "Add",
                    onPressed: () {
                      if (globalKey.currentState!.validate() &&
                              selectedCategory != null &&
                              selectedWallet != null &&
                          type != null) {
                        context.read<OperationBloc>().add(
                              AddOperationEvent(
                                operation: Operation(
                                  name: nameController.text,
                                  value: double.parse(valueController.text),
                                  description: descriptionController.text,
                                  categoryId: selectedCategory!.id!,
                                  walletId: selectedWallet!.id!,
                                  date: date ?? DateTime.now(),
                                  category: selectedCategory,
                                  wallet: selectedWallet,
                                  type: type!,
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

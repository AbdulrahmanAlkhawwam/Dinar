import 'package:Dinar/core/components/dialog/time_dialog.dart';
import 'package:Dinar/core/constants/strings.dart';

import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:Dinar/features/incomes/domain/entities/income.dart';
import 'package:Dinar/features/wallets/domain/entities/wallet.dart';
import 'package:Dinar/features/wallets/presentation/manager/wallets_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/components/inters/input_field.dart';
import '../../../../core/utils/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';

import '../../../../core/components/buttons/menu_button.dart';
import '../../../categories/presentation/manager/categories_bloc.dart';
import '../manager/income_bloc.dart';

class AddIncomeScreen extends StatelessWidget {
  AddIncomeScreen({super.key});

  final nameController = TextEditingController();
  final valueController = TextEditingController();
  final descriptionController = TextEditingController();
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final categoryMenu = context.read<CategoriesBloc>().incomeCategories;
    final wallets = context.read<WalletsBloc>().wallets;
    Category? selectedCategory;
    Wallet? selectedWallet;
    DateTime? date;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32,
        ),
        child: Form(
          key: globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Add new",
                    style: TextStyle(
                      fontSize: 24,
                      color: context.colors.onSurface,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
              GradientText(
                Text(
                  "Income".toUpperCase(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                    height: 0,
                  ),
                ),
                colors: [
                  context.colors.onSurface,
                  context.colors.primary,
                ],
              ),
              const SizedBox(height: 48),
              InputField(
                isEnabled: true,
                hint: "name",
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
                hint: "value",
                validator: (value) {
                  if (value == "" || value.trim() == "") {
                    return "value must not be empty";
                  } else if (double.tryParse(value) == null) {
                    return "value must consist of numbers";
                  }
                  return null;
                },
                controller: valueController,
              ),
              const SizedBox(height: 24),
              InputField(
                isEnabled: true,
                hint: "description",
                controller: descriptionController,
              ),
              const SizedBox(height: 24),
              MenuButton(
                menu: categoryMenu
                    .map(
                      (category) => category.name,
                    )
                    .toList(),
                text: categoriesTable,
                onTap: (index) {
                  selectedCategory = categoryMenu[index];
                },
              ),
              const SizedBox(height: 24),
              MenuButton(
                text: "wallet",
                menu: wallets
                    .map(
                      (wallet) => wallet.name,
                    )
                    .toList(),
                onTap: (index) {
                  selectedWallet = Wallet(
                    id: index,
                    name: "name",
                  );
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: PrimaryButton(
                  text: "Get Time",
                  onPressed: () async {
                    TimeOfDay output = await showDialog(
                      context: context,
                      builder: (ctx) => TimeDialog(),
                    );
                    date = DateTime.now().copyWith(
                      hour: output.hour,
                      minute: output.minute,
                      microsecond: 0,
                      millisecond: 0,
                    );
                    print(date);
                  },
                ),
              ),
              const Spacer(),
              Center(
                child: PrimaryButton(
                  text: "add".toUpperCase(),
                  onPressed: () {
                    if (globalKey.currentState!.validate() &&
                        selectedCategory != null &&
                        selectedWallet != null) {
                      context.read<IncomeBloc>().add(
                            AddIncomeEvent(
                              income: Income(
                                null,
                                name: nameController.text,
                                value: double.parse(valueController.text),
                                description: descriptionController.text,
                                categoryId: selectedCategory?.id ?? "",
                                walletId: selectedWallet?.id ?? "",
                                date: date ?? DateTime.now(),
                                category: selectedCategory,
                                wallet: selectedWallet,
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
    );
  }
}

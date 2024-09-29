import 'package:easy_localization/easy_localization.dart';

import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/components/dialog/menu_dialog.dart';
import '../../../../core/components/inters/input_field.dart';
import '../../../../core/utils/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';

import '../../../../core/components/buttons/menu_button.dart';

class AddIncomeScreen extends StatelessWidget {
  AddIncomeScreen({super.key});

  final nameController = TextEditingController();
  final valueController = TextEditingController();
  final descriptionController = TextEditingController();
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                height: 24,
              ),
              MenuButton(
                menu: ["name ", "hour"],
                text: "category",
                onTap: (index) {
                  print("+++ $index");
                },
              ),
              const SizedBox(
                height: 24,
              ),
              MenuButton(
                text: "wallet",
                menu: [],
                onTap: (index) {},
              ),
              const Spacer(),
              Center(
                child: PrimaryButton(
                  text: "add".toUpperCase(),
                  onPressed: () {
                    globalKey.currentState?.validate();
                    context.showSuccessSnackBar();
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

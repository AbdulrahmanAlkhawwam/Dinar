import 'package:Dinar/src/core/components/buttons/primary_button.dart';
import 'package:Dinar/src/core/components/dialog/menu_dialog.dart';
import 'package:Dinar/src/core/components/inters/input_field.dart';
import 'package:Dinar/src/core/utils/app_context.dart';
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
                label: "name",
                controller: nameController,
                validator: (value) {
                  if (value == "" || value.trim() == "") {
                    return "Name must not be empty";
                  } else if (value.trim().length < 8 ||
                      value.trim().length > 20) {
                    return "Name must consist of letters";
                  } else if (double.tryParse(value) != null) {
                    return "Name must consist of letters";
                  }
                  return "";
                },
              ),
              const SizedBox(height: 24),
              InputField(
                keyboardType: TextInputType.number,
                isEnabled: true,
                label: "value",
                validator: (value) {
                  if (value == "" || value.trim() == "") {
                    return "value must not be empty";
                  } else if (double.tryParse(value) == null) {
                    return "value must consist of numbers";
                  }
                  return "";
                },
                controller: valueController,
              ),
              const SizedBox(height: 24),
              InputField(
                isEnabled: true,
                label: "description",
                controller: descriptionController,
              ),
              const SizedBox(
                height: 24,
              ),
              MenuButton(
                text: "category",
                onPressed: () {
                  showDialog(
                      context: context, builder: (context) => MenuDialog());
                },
              ),
              const SizedBox(
                height: 24,
              ),
              MenuButton(
                text: "wallet",
                onPressed: () {},
              ),
              const Spacer(),
              Center(
                child: PrimaryButton(
                  text: "add".toUpperCase(),
                  onPressed: () {
                    globalKey.currentState?.validate();
                    context.showErrorSnackBar();
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


import 'package:Dinar/src/core/components/inters/input_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/styles/colors/main_colors.dart';
import '../../domain/entities/category.dart';

class CategoriesBottomSheet extends StatelessWidget {
  CategoriesBottomSheet({super.key});

  final globalKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom + 32,
        top: 32,
        left: 24,
        right: 24,
      ),
      child: Form(
        key: globalKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Create your category",
              style: TextStyle(
                color: MainColors.darkTeal,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 32),
            InputField(
              isEnabled: true,
              controller: nameController,
              label: "Name",
              validate: "this should not empty !",
            ),
            const SizedBox(height: 16),
            InputField(
              isEnabled: true,
              controller: typeController,
              label: "Type",
              validator: (value) {
                if (!value.toString().trim().toLowerCase().contains("income") &&
                    !value
                        .toString()
                        .trim()
                        .toLowerCase()
                        .contains("payment")) {
                  return "it must be 'Income' or 'Payment' !";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState?.save();
                  Navigator.pop(
                    context,
                    Category(
                      "",
                      name: nameController.text,
                      type: typeController.text.contains("income")
                          ? "income"
                          : "payment",
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}

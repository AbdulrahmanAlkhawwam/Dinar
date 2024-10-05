import 'package:Dinar/core/utils/app_context.dart';

import '../../../../core/components/buttons/menu_button.dart';
import '../../../../core/components/inters/input_field.dart';
import '../../../app/domain/entities/operation_type.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/styles/colors/main_colors.dart';
import '../../domain/entities/category.dart';

class CategoriesBottomSheet extends StatefulWidget {
  CategoriesBottomSheet({super.key});

  @override
  State<CategoriesBottomSheet> createState() => _CategoriesBottomSheetState();
}

class _CategoriesBottomSheetState extends State<CategoriesBottomSheet> {
  final globalKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  OperationType? _selectedType;

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
              hint: "Name",
              validate: "this should not empty !",
            ),
            const SizedBox(height: 16),
            MenuButton(
              text: "Type",
              menu: OperationType.values
                  .map(
                    (operation) => operation.name,
                  )
                  .toList(),
              onTap: (value) => setState(() => _selectedType = value == "income"
                  ? OperationType.income
                  : OperationType.payment),
            ),
            const SizedBox(height: 8),
            _selectedType == null
                ? Text(
                    textAlign: TextAlign.start,
                    "please select type for this category !",
                    style: context.textTheme.labelSmall
                        ?.copyWith(color: context.colors.error),
                  )
                : const SizedBox(),
            const SizedBox(height: 32),
            PrimaryButton(
              onPressed: () {
                if (globalKey.currentState!.validate() &&
                    _selectedType != null) {
                  globalKey.currentState?.save();
                  Navigator.pop(
                    context,
                    Category(
                      "",
                      name: nameController.text,
                      type: _selectedType ?? OperationType.income,
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

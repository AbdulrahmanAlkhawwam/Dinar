import 'package:Dinar/core/constants/strings.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/components/buttons/menu_button.dart';
import '../../../../core/components/inters/input_field.dart';
import '../../../../core/components/buttons/primary_button.dart';

class CategoriesBottomSheet extends StatefulWidget {
  const CategoriesBottomSheet({super.key});

  @override
  State<CategoriesBottomSheet> createState() => _CategoriesBottomSheetState();
}

class _CategoriesBottomSheetState extends State<CategoriesBottomSheet> {
  final globalKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  OperationType? _selectedType;
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.bottomInsets + 32,
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
              texts[texts["app"]["cat_type"]]["title"] ?? texts["error_msg"],
              style: context.textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            InputField(
              isEnabled: true,
              controller: nameController,
              hint: texts[texts["app"]["cat_type"]]["sheet"]["hint"],
              validate: texts[texts["app"]["cat_type"]]["sheet"]["validate"],
            ),
            const SizedBox(height: 16),
            MenuButton(
              selected: _selectedType?.name,
              text: texts[texts["app"]["cat_type"]]["sheet"]["menu"],
              menu: OperationType.values
                  .map(
                    (operation) => operation.name,
                  )
                  .toList(),
              onTap: (value) => setState(
                () => _selectedType = value == OperationType.income.name
                    ? OperationType.income
                    : OperationType.payment,
              ),
            ),
            const SizedBox(height: 8),
            _selectedType == null && checked
                ? Text(
                    textAlign: TextAlign.start,
                    texts[texts["app"]["cat_type"]]["sheet"]["empty_menu"],
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colors.error,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 32),
            PrimaryButton(
              text: texts[texts["app"]["cat_type"]]["sheet"]["button"],
              onPressed: () {
                if (globalKey.currentState!.validate() &&
                    _selectedType != null) {
                  globalKey.currentState?.save();
                  Navigator.pop(
                    context,
                    Category(
                      name: nameController.text,
                      type: _selectedType ?? OperationType.income,
                    ),
                  );
                }
                {
                  setState(() => checked = true);
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

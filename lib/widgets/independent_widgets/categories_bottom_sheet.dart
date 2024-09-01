import 'package:core/components/dynamic_components/primary_button.dart';
import 'package:core/styles/colors/main_colors.dart';
import 'package:core/components/dynamic_components/default_text_form_feild.dart';
import 'package:flutter/material.dart';

class CategoriesBottomSheet extends StatelessWidget {
  CategoriesBottomSheet({super.key});

  final TextEditingController titleController = TextEditingController();
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
          DefaultTextFormField(
            onSubmitted: (value)=>print(value),
            controller: titleController,
            label: "Title",
          ),
          const SizedBox(height: 16),
          DefaultTextFormField(
            onSubmitted: (value)=>print(value),
            controller: typeController,
            label: "Type",
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 24)
        ],
      ),
    );
  }
}

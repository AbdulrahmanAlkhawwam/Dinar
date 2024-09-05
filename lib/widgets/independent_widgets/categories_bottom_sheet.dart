import 'package:core/components/dynamic_components/primary_button.dart';
import 'package:core/styles/colors/main_colors.dart';
import 'package:core/components/dynamic_components/default_text_form_feild.dart';
import 'package:flutter/material.dart';

class CategoriesBottomSheet extends StatelessWidget {
  CategoriesBottomSheet({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  var globalKey = GlobalKey<FormState>();
  String? title;
  String? type;

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
            DefaultTextFormField(
              // onChanged: (value){},
              controller: titleController,
              label: "Title",
              validate: "this should not empty !",
            ),
            const SizedBox(height: 16),
            DefaultTextFormField(
              onChanged: (value){},
              controller: typeController,
              label: "Type",
              validate: "this should not empty !",
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              onPressed: () {
                if(globalKey.currentState!.validate()){
                  Navigator.pop(context);
                }
                globalKey.currentState?.save();
                print(titleController.text);
                print(typeController.text);

              },
            ),
            const SizedBox(height: 24)
          ],
        ),
      ),
    );
  }
}

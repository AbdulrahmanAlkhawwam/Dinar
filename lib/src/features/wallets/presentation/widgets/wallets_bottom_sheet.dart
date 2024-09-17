import 'package:Dinar/src/features/wallets/domain/entities/wallet.dart';
import 'package:core/components/default_text_form_feild.dart';
import 'package:core/components/buttons/primary_button.dart';
import 'package:core/styles/colors/main_colors.dart';
import 'package:flutter/material.dart';

class WalletsBottomSheet extends StatelessWidget {
  WalletsBottomSheet({super.key});

  final globalKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

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
              isEnabled: true,
              controller: nameController,
              label: "Name",
              validate: "this must not empty !",
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState?.save();
                  Navigator.pop(
                    context,
                    Wallet(
                      "",
                      name: nameController.text,
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

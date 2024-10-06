import 'package:Dinar/core/utils/app_context.dart';

import '../../../../core/components/inters/input_field.dart';
import '../../../wallets/domain/entities/wallet.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/buttons/primary_button.dart';

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
                color: context.colors.onTertiaryContainer,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 32),
            InputField(
              isEnabled: true,
              controller: nameController,
              hint: "Name",
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
                      id: "",
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

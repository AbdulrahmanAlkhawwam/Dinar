import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/components/inters/input_field.dart';
import '../../../../core/utils/app_context.dart';
import '../../domain/entities/wallet.dart';

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
              texts[texts["app"]["wal_type"]]["title"],
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 32),
            InputField(
              isEnabled: true,
              controller: nameController,
              hint: texts[texts["app"]["wal_type"]]["sheet"]["hint"],
              validate: texts[texts["app"]["wal_type"]]["sheet"]["validate"],
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              text: texts[texts["app"]["wal_type"]]["sheet"]["button"],
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState?.save();
                  Navigator.pop(
                    context,
                    Wallet(name: nameController.text),
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

import 'package:Dinar/core/components/buttons/float_button.dart';
import 'package:Dinar/core/components/buttons/primary_button.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:flutter/material.dart';

class MoreSheet extends StatelessWidget {
  const MoreSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.onSurface.withOpacity(0.5),
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 32, 32, 48),
        child: Column(
          children: [
            const Spacer(),
            PrimaryButton(onPressed: () {}, text: ("Add category")),
            const Spacer(),
            PrimaryButton(onPressed: () {}, text: ("Add Wallet")),
            const Spacer(),
            PrimaryButton(onPressed: () {}, text: ("Add income")),
            const Spacer(),
            PrimaryButton(onPressed: () {}, text: ("Add payment")),
            const Spacer(),
            PrimaryButton(onPressed: () {}, text: ("Show history")),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: FloatButton(
                onPressed: () => context.pop(),
                text: "Less",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import '../../../wallets/domain/entities/wallet.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors/light_colors.dart';
import '../../../../core/styles/colors/main_colors.dart';

class WalletItemHorizontal extends StatelessWidget {
  WalletItemHorizontal({super.key});

  final Wallet wallet = Wallet(
    id: "",
    balance: 0.0,
    name: "name",
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 120,
      decoration: BoxDecoration(
        gradient: LightColors.widgetCardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MainColors.teaGreen),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "wallet.name",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "incomes tot : 121212",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "payments tot : 121212",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Spacer(),
            Center(
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                "total : 12120012",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

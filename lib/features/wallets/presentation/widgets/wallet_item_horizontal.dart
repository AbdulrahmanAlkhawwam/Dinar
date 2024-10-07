import 'package:flutter/material.dart';

import '../../domain/entities/wallet.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/constants/colors.dart';

class WalletItemHorizontal extends StatelessWidget {
  final Wallet wallet;

  const WalletItemHorizontal({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        gradient: GradientLightColor.cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.colors.secondaryContainer,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                wallet.name.toUpperCase(),
                style: context.textTheme.titleLarge,
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                "Total : ${wallet.balance ?? 0.0}",
                style: context.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

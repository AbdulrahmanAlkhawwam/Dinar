import 'package:Dinar/core/components/cards/list_card.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/wallets/presentation/pages/wallet_details_screen.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/wallet.dart';

class WalletItem extends StatelessWidget {
  final Wallet wallet;

  final bool isHorizontal;

  const WalletItem({
    super.key,
    required this.wallet,
    required this.isHorizontal,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(MaterialPageRoute(
        builder: (context) => WalletDetailsScreen(wallet: wallet),
      )),
      child: ListCard(
        isHorizontal: isHorizontal,
        child: isHorizontal
            ? Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        wallet.name.toUpperCase(),
                        style: context.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  wallet.name,
                  style: context.textTheme.titleLarge?.copyWith(height: 0),
                ),
              ),
      ),
    );
  }
}

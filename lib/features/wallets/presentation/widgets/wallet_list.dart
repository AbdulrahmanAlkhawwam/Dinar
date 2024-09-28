import '../../../wallets/presentation/widgets/wallet_item_horizontal.dart';
import 'package:flutter/material.dart';

class WalletList extends StatelessWidget {
  const WalletList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => WalletItemHorizontal(),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemCount: 15,
      ),
    );
  }
}

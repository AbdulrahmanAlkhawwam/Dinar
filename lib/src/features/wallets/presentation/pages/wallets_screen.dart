import 'package:Dinar/src/core/utils/app_context.dart';
import 'package:Dinar/src/features/app/domain/entities/operation_type.dart';
import 'package:Dinar/src/features/categories/domain/entities/category.dart';
import 'package:Dinar/src/features/categories/presentation/widgets/category_item_vertical.dart';
import 'package:Dinar/src/features/wallets/domain/entities/wallet.dart';
import 'package:Dinar/src/features/wallets/presentation/widgets/wallet_item_vertical.dart';
import 'package:flutter/material.dart';

import '../../../payments/presentation/widgets/payment_item.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Wallet> wallets = [
      Wallet(
        "",
        0.0,
        name: "food",
      ),
      Wallet(
        "",
        0.0,
        name: "food",
      ),
      Wallet(
        "",
        0,
        name: "food",
      ),
      Wallet(
        "",
        0,
        name: "food",
      ),
      Wallet(
        "",
        0,
        name: "food",
      ),
      Wallet(
        "",
        0,
        name: "food",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Wallets"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) =>
            WalletItemVertical(wallet: wallets[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: wallets.length,
      ),
    );
  }
}

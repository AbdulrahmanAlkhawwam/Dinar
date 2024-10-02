
import '../../../wallets/domain/entities/wallet.dart';
import '../../../wallets/presentation/widgets/wallet_item_vertical.dart';
import 'package:flutter/material.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Wallet> wallets = [
      Wallet(
        "",
        balance: 0.0,
        name: "food",
      ),
      Wallet(
        "",
        balance: 0.0,
        name: "food",
      ),
      Wallet(
        "",
        balance: 0,
        name: "food",
      ),
      Wallet(
        "",
        balance: 0,
        name: "food",
      ),
      Wallet(
        "",
        balance: 0,
        name: "food",
      ),
      Wallet(
        "",
        balance: 0,
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

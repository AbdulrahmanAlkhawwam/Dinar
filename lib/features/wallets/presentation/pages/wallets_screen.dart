import 'package:Dinar/core/components/buttons/float_button.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../wallets/domain/entities/wallet.dart';
import '../../../wallets/presentation/widgets/wallet_item_vertical.dart';
import 'package:flutter/material.dart';

import '../manager/wallets_bloc.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wallets = context.read<WalletsBloc>().wallets;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Wallets"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView.separated(
          itemBuilder: (context, index) =>
              WalletItemVertical(wallet: wallets[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: wallets.length,
        ),
      ),
    );
  }
}

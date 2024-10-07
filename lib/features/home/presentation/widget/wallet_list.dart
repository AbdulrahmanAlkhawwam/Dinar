import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../wallets/presentation/pages/wallets_screen.dart';
import '../../../wallets/presentation/manager/wallets_bloc.dart';
import '../../../wallets/presentation/widgets/wallet_item_horizontal.dart';
import '../../../../core/utils/app_context.dart';

class WalletList extends StatelessWidget {
  const WalletList({super.key});

  @override
  Widget build(BuildContext context) {
    final wallets = context.read<WalletsBloc>().wallets;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              "Wallets",
              style: context.textTheme.titleSmall,
            ),
            const Spacer(),
            TextButton(
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(
                    double.infinity,
                    double.minPositive,
                  ),
                ),
              ),
              onPressed: () => context.push(
                MaterialPageRoute(
                  builder: (context) => WalletsScreen(),
                ),
              ),
              child: Text(
                "show more",
                style: context.textTheme.labelSmall,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 130,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 24),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => WalletItemHorizontal(
                wallet: wallets[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemCount: wallets.length,
            ),
          ),
        ),
      ],
    );
  }
}

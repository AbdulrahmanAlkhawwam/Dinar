import 'package:Dinar/core/components/cards/list_card.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/widgets/sheet.dart';
import '../../../onboarding/presentation/widgets/delete_check_bottom_sheet.dart';
import '../../domain/entities/wallet.dart';
import '../manager/wallets_bloc.dart';

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
    return ListCard(
      isHorizontal: isHorizontal,
      child: isHorizontal
          ? Padding(
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
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            wallet.name,
                            style: context.textTheme.titleMedium,
                          ),
                          Text(
                            "${wallet.balance ?? 0.0}",
                            style: context.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        final result = await sheet(
                            context: context,
                            content: DeleteCheckBottomSheet(
                                type: "Wallets",
                                category: null,
                                wallet: wallet));
                        if (result) {
                          context.read<WalletsBloc>().add(
                                DeleteWalletEvent(wallet: wallet),
                              );
                        }
                      },
                      icon: Icon(
                        Icons.delete_outline,
                        color: context.colors.error,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

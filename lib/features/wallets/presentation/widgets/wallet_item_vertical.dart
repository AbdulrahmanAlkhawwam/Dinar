import 'package:Dinar/features/wallets/presentation/manager/wallets_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/widgets/sheet.dart';
import '../../../app/domain/entities/operation_type.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/colors/main_colors.dart';
import '../../../../core/utils/app_context.dart';
import '../../../onboarding/presentation/widgets/delete_check_bottom_sheet.dart';
import '../../domain/entities/wallet.dart';

class WalletItemVertical extends StatelessWidget {
  final Wallet wallet;

  const WalletItemVertical({
    super.key,
    required this.wallet,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: context.colors.onSecondary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: context.colors.secondaryContainer,
            width: 3,
          ),
        ),
        child: Padding(
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
                            type: "Wallets", category: null, wallet: wallet));
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
      ),
    );
  }
}

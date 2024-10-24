import 'package:Dinar/core/components/cards/list_card.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/operations/domain/entities/operation.dart';
import 'package:Dinar/features/wallets/presentation/pages/wallet_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/widgets/sheet.dart';
import '../../../../core/constants/strings.dart';
import '../../../onboarding/presentation/widgets/delete_check_bottom_sheet.dart';
import '../../../operations/presentation/manager/operation_bloc.dart';
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
    return InkWell(
      onTap: () {
        context
            .read<OperationBloc>()
            .add(GetWalletOperationEvent(wallet: wallet));
        context.push(MaterialPageRoute(
          builder: (context) => WalletDetailsScreen(wallet: wallet),
        ));
      },
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
                        style: context.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8),
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
                              "Total : ${wallet.balance ?? 0.toInt()}",
                              style: context.textTheme.labelMedium?.copyWith(
                                color: context.colors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

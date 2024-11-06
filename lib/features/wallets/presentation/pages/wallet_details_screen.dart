import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/cards/empty_card.dart';
import '../../../../core/components/widgets/error_content.dart';
import '../../../../core/components/widgets/sheet.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/utils/app_context.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../onboarding/presentation/widgets/delete_check_bottom_sheet.dart';
import '../../../operations/presentation/manager/operation_bloc.dart';
import '../../../operations/presentation/pages/operations_screen.dart';
import '../../domain/entities/wallet.dart';
import '../manager/bloc/wallets_bloc.dart';

class WalletDetailsScreen extends StatelessWidget {
  final Wallet wallet;

  const WalletDetailsScreen({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletsBloc, WalletsState>(
      listener: (context, state) {
        if (state is WalletDeleted && state.wallet.id == wallet.id) {
          context.pop();
        }
        if (state is WalletsError) {
          context.showErrorSnackBar(massage: state.message.value.toString());
        }
      },
      child: BlocBuilder<OperationBloc, OperationState>(
        builder: (context, state) {
          getBalance() {
            double sum = 0;
            if (state is OperationLoaded) {
              for (var operation in state.operations) {
                if (operation.type == OperationType.income &&
                    operation.walletId == wallet.id) {
                  sum += operation.value;
                } else if (operation.walletId == wallet.id) {
                  sum -= operation.value;
                }
              }
            }
            return sum;
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(wallet.name.toUpperCase()),
              actions: [
                IconButton(
                  onPressed: () async {
                    final result = await sheet(
                        context: context,
                        content: DeleteCheckBottomSheet(
                            type: texts["app"]["wal_type"],
                            category: null,
                            wallet: wallet));
                    if (result) {
                      context
                          .read<WalletsBloc>()
                          .add(DeleteWalletEvent(wallet: wallet));
                    }
                  },
                  icon: Icon(
                    Icons.delete_outline,
                    color: context.colors.error,
                  ),
                )
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.colors.secondary,
                        width: border,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: context.colors.primaryContainer,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("name : ${wallet.name}"),
                          const SizedBox(height: 4),
                          Text("balance : ${getBalance()} \$"),
                        ],
                      ),
                    ),
                  ),
                ),
                state is OperationLoaded &&
                        state.operations
                            .where((element) => element.walletId == wallet.id)
                            .isEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: EmptyCard(
                          mainText: "Operations is ",
                          text: "Empty",
                        ),
                      )
                    : Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                              child: Row(
                                children: [
                                  Text(
                                    "Operations",
                                    style: context.textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            switch (state) {
                              OperationError _ => Expanded(
                                  child: ErrorContent(
                                    message: state.message.value,
                                    errorMessage: Text(
                                      "ERROR",
                                      style: context.textTheme.titleLarge
                                          ?.copyWith(fontSize: 60, height: 0),
                                    ),
                                  ),
                                ),
                              OperationLoaded _ => Expanded(
                                  child: OperationsScreen(wallet: wallet),
                                ),
                              _ => const SizedBox(),
                            },
                          ],
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}

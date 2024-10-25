import 'package:Dinar/core/components/widgets/error_content.dart';
import 'package:Dinar/core/constants/styles.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/app/domain/entities/operation_type.dart';
import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:Dinar/features/operations/presentation/pages/operations_screen.dart';
import 'package:Dinar/features/wallets/domain/entities/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/components/widgets/sheet.dart';
import '../../../../core/components/widgets/skeleton.dart';
import '../../../../core/constants/strings.dart';
import '../../../onboarding/presentation/widgets/delete_check_bottom_sheet.dart';
import '../../../operations/presentation/manager/operation_bloc.dart';
import '../../../operations/presentation/pages/add_operation_screen.dart';
import '../../../operations/presentation/widgets/operation_item.dart';
import '../manager/wallets_bloc.dart';

class WalletDetailsScreen extends StatelessWidget {
  final Wallet wallet;

  const WalletDetailsScreen({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletsBloc, WalletsState>(
      listener: (context, state) {
        if (state is WalletDeleted) {
          context.pop();
        }
      },
      child: BlocBuilder<OperationBloc, OperationState>(
        builder: (context, state) {
          getBalance() {
            double sum = 0;
            if (state is WalletOperationLoaded) {
              for (var operation in state.operations) {
                if (operation.type == OperationType.income) {
                  sum += operation.value;
                } else {
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
                        color: context.colors.primaryContainer),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                  child: Row(
                    children: [
                      Text(
                        "Operations",
                        style: context.textTheme.titleMedium,
                      ),
                      // const Spacer(),
                      // IconButton(
                      //   onPressed: () => context.push(
                      //     MaterialPageRoute(
                      //       builder: (context) => AddOperationScreen(),
                      //     ),
                      //   ),
                      //   icon: Icon(Icons.add),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(child: OperationsScreen(wallet: wallet))
              ],
            ),
          );
        },
      ),
    );
  }
}

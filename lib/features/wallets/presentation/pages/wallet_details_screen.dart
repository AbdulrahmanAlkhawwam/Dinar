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

import '../../../../core/components/widgets/skeleton.dart';
import '../../../operations/presentation/manager/operation_bloc.dart';
import '../../../operations/presentation/widgets/operation_item.dart';

class WalletDetailsScreen extends StatelessWidget {
  final Wallet wallet;

  const WalletDetailsScreen({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationBloc, OperationState>(
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
              IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline))
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
                child: Text(
                  "Operations",
                  style: context.textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(child: OperationsScreen(wallet: wallet))
            ],
          ),
        );
      },
    );
  }
}

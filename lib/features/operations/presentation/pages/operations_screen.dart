import 'package:Dinar/features/app/domain/entities/operation_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';
import '../../../wallets/domain/entities/wallet.dart';
import '../manager/operation_bloc.dart';
import '../widgets/operation_item.dart';

class OperationsScreen extends StatefulWidget {
  final Wallet? wallet;

  const OperationsScreen({
    super.key,
    this.wallet,
  });

  @override
  State<OperationsScreen> createState() => _OperationsScreenState();
}

class _OperationsScreenState extends State<OperationsScreen>
    with TickerProviderStateMixin {
  int index = 0;

  @override
  void initState() {
    if (widget.wallet != null) {
      context
          .read<OperationBloc>()
          .add(GetWalletOperationEvent(wallet: widget.wallet!));
    } else {
      context.read<OperationBloc>().add(LoadOperationsEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OperationBloc, OperationState>(
      listener: (context, state) {
        if (state is OperationLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
        if (state is OperationError) {
          context.showErrorSnackBar(massage: state.message.value);
        }
        // TODO : fix this
        // if (state is OperationDeleted) {
        //   context.showSuccessSnackBar(
        //       massage: "${state.category.name} : was deleted");
        // }
      },
      builder: (context, state) {
        if (state is OperationLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is OperationLoaded) {
          final incomes = state.operations
              .where((element) => element.type == OperationType.income)
              .toList();
          final payments = state.operations
              .where((element) => element.type == OperationType.payment)
              .toList();
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  dividerColor: context.colors.surface,
                  onTap: (value) => setState(() => index = value),
                  labelStyle: context.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                  tabs: [
                    Tab(text: "(${incomes.length}) incomes"),
                    Tab(text: "(${payments.length}) payments"),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: OperationItem(
                          operation: switch (this.index) {
                            0 => incomes[index],
                            _ => payments[index],
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: switch (index) {
                      0 => incomes.length,
                      _ => payments.length,
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is WalletOperationLoaded) {
          final incomes = state.operations
              .where((element) => element.type == OperationType.income)
              .toList();
          final payments = state.operations
              .where((element) => element.type == OperationType.payment)
              .toList();
          return DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  dividerColor: context.colors.surface,
                  onTap: (value) => setState(() => index = value),
                  labelStyle: context.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                  tabs: [
                    Tab(text: "(${incomes.length}) incomes"),
                    Tab(text: "(${payments.length}) payments"),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: OperationItem(
                          operation: switch (this.index) {
                            0 => incomes[index],
                            _ => payments[index],
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: switch (index) {
                      0 => incomes.length,
                      _ => payments.length,
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

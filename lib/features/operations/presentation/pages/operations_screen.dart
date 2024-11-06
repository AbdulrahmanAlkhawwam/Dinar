import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';
import '../../../app/domain/entities/operation_type.dart';
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
    context.read<OperationBloc>().add(LoadOperationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OperationBloc, OperationState>(
      listener: (context, state) {
        if (state is OperationAdded || state is OperationDeleted) {
          context.read<OperationBloc>().add(LoadOperationsEvent());
        }
        if (state is OperationError) {
          context.showErrorSnackBar(massage: state.message.value);
        }
      },
      builder: (context, state) {
        if (state is OperationLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is OperationLoaded) {
          final incomes = state.operations
              .where(
                (element) => widget.wallet == null
                    ? element.type == OperationType.income
                    : (element.type == OperationType.income &&
                        element.walletId == widget.wallet!.id),
              )
              .toList();
          final payments = state.operations
              .where(
                (element) => widget.wallet == null
                    ? element.type == OperationType.payment
                    : (element.type == OperationType.payment &&
                        element.walletId == widget.wallet!.id),
              )
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
        } else if (state is OperationLoaded) {
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
                    Tab(
                        text: "(${state.operations.where(
                              (element) => element.type == OperationType.income,
                            ).length}) incomes"),
                    Tab(
                        text: "(${state.operations.where(
                              (element) =>
                                  element.type == OperationType.payment,
                            ).length}) payments"),
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
                            0 => state.operations
                                .where((element) =>
                                    element.type == OperationType.income)
                                .toList()[index],
                            _ => state.operations
                                .where((element) =>
                                    element.type == OperationType.payment)
                                .toList()[index],
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: switch (index) {
                      0 => state.operations
                          .where(
                              (element) => element.type == OperationType.income)
                          .toList()
                          .length,
                      _ => state.operations
                          .where(
                              (element) => element.type == OperationType.income)
                          .toList()
                          .length,
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

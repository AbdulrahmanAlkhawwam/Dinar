import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';
import '../../domain/entities/operation.dart';
import '../manager/operation_bloc.dart';
import '../widgets/operation_item.dart';

class OperationsScreen extends StatefulWidget {
  const OperationsScreen({super.key});

  @override
  State<OperationsScreen> createState() => _OperationsScreenState();
}

class _OperationsScreenState extends State<OperationsScreen>
    with TickerProviderStateMixin {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Operation> incomeOperations =
        context.read<OperationBloc>().incomesOperation;
    List<Operation> paymentOperations =
        context.read<OperationBloc>().paymentsOperation;

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
        if (state is OperationLoaded) {
          incomeOperations = context.read<OperationBloc>().incomesOperation;
          paymentOperations = context.read<OperationBloc>().paymentsOperation;
        }
        // TODO : fix this
        // if (state is OperationDeleted) {
        //   context.showSuccessSnackBar(
        //       massage: "${state.category.name} : was deleted");
        // }
      },
      builder: (context, state) {
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
                  Tab(text: "(${incomeOperations.length}) incomes"),
                  Tab(text: "(${paymentOperations.length}) payments"),
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
                          0 => incomeOperations[index],
                          _ => paymentOperations[index],
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemCount: switch (index) {
                    0 => incomeOperations.length,
                    _ => paymentOperations.length,
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

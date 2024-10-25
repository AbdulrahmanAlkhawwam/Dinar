import 'package:Dinar/core/components/widgets/items_list.dart';
import 'package:Dinar/features/history/presentation/pages/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../operations/presentation/manager/operation_bloc.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationBloc, OperationState>(
      builder: (context, state) {
        if (state is OperationInitial ||
            state is OperationError ||
            state is OperationLoaded && state.operations.isEmpty) {
          return const SizedBox();
        } else {
          if (state is OperationLoaded) {
            return ItemsList(
              list: state.operations,
              type: "operation",
              // title: "Wallets",
              route: MaterialPageRoute(
                builder: (context) => HistoryScreen(),
              ),
            );
          }
          return const SizedBox();
        }
      },
    );
  }
}

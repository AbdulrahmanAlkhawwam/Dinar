import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/history/presentation/pages/history_screen.dart';
import 'package:Dinar/features/operations/presentation/widgets/operation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../operations/presentation/manager/operation_bloc.dart';
import '../../../wallets/presentation/pages/wallets_screen.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationBloc, OperationState>(
      builder: (context, state) {
        print(state);
        if (state is OperationLoaded) {
          return SizedBox(
            height: state.operations.isEmpty
                ? 0
                : state.operations.length < 2
                    ? 200
                    : 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("History"),
                    const Spacer(),
                    TextButton(
                      style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(
                          Size(
                            double.infinity,
                            double.minPositive,
                          ),
                        ),
                      ),
                      onPressed: () => context.push(
                        MaterialPageRoute(
                          builder: (context) => HistoryScreen(),
                        ),
                      ),
                      child: Text(
                        "show more",
                        style: context.textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        OperationItem(operation: state.operations[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: state.operations.length,
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

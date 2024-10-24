import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/history/presentation/pages/history_screen.dart';
import 'package:Dinar/features/operations/presentation/widgets/operation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../operations/presentation/manager/operation_bloc.dart';

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
                    ? 150
                    : state.operations.length == 2
                        ? 250
                        : 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    "History",
                    style: context.textTheme.titleSmall,
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: RangeMaintainingScrollPhysics(),
                    itemBuilder: (context, index) => index == 2
                        ? InkWell(
                            onTap: () => context.push(
                              MaterialPageRoute(
                                builder: (context) => HistoryScreen(),
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: context.colors.onPrimaryContainer,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 30,
                              width: double.infinity,
                              child: Center(
                                  child: Text(
                                "show more",
                                style: context.textTheme.labelLarge?.copyWith(
                                    color: context.colors.primaryContainer),
                              )),
                            ),
                          )
                        : OperationItem(operation: state.operations[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemCount: state.operations.length > 2
                        ? 3
                        : state.operations.length,
                  ),
                ),
                const SizedBox(height: 16)
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

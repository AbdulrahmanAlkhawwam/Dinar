import 'package:Dinar/core/components/cards/empty_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/components/widgets/skeleton.dart';
import '../../../../core/utils/app_context.dart';
import '../../../history/presentation/pages/history_screen.dart';
import '../../../operations/presentation/manager/operation_bloc.dart';
import '../../../operations/presentation/widgets/operation_item.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationBloc, OperationState>(
      builder: (context, state) {
        if (state is OperationLoaded && state.operations.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: EmptyCard(text: "Operations is "),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Operations",
                  style: context.textTheme.titleSmall,
                ),
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
            switch (state) {
              OperationLoading _ => Expanded(
                  child: Shimmer.fromColors(
                    baseColor: context.colors.outline.withOpacity(0.25),
                    highlightColor: context.colors.surface.withOpacity(0.25),
                    enabled: true,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ListView.builder(
                        itemBuilder: (context, index) => Skeleton(
                          height: 74,
                          width: double.infinity,
                          borderRadius: 10,
                        ),
                        itemCount: 5,
                      ),
                    ),
                  ),
                ),
              OperationLoaded _ => Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListView.separated(
                          physics: RangeMaintainingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              OperationItem(operation: state.operations[index]),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                          itemCount: state.operations.length,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () => context.push(MaterialPageRoute(
                          builder: (context) => HistoryScreen(),
                        )),
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
                    ],
                  ),
                ),
              _ => const SizedBox()
            }
          ],
        );
      },
    );
  }
}

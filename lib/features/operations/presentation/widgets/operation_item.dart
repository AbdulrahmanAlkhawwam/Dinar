import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/cards/tag_card.dart';
import '../../../../core/utils/app_context.dart';
import '../../domain/entities/operation.dart';
import '../manager/operation_bloc.dart';

class OperationItem extends StatelessWidget {
  final Operation operation;
  final bool isCategoryAppear;

  final bool isWalletAppear;

  const OperationItem({
    super.key,
    required this.operation,
    this.isWalletAppear = true,
    this.isCategoryAppear = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.onSecondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.colors.primary.withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        operation.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      operation.description!.trim().isNotEmpty
                          ? Text(
                              "description : ${operation.description}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            )
                          : const SizedBox(),
                      const SizedBox(height: 4),
                      Text(
                        "date : ${DateFormat.yMMMMd().format(operation.date)}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "price : ${operation.value}",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () => context
                      .read<OperationBloc>()
                      .add(DeleteOperationEvent(operation: operation)),
                  icon: Icon(
                    Icons.delete_outline,
                    color: context.colors.error,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              child: Row(
                children: [
                  TagCard(
                    isAppear: isCategoryAppear,
                    operationType: operation.type,
                    text: operation.category!.name,
                  ),
                  isCategoryAppear
                      ? const SizedBox(width: 16)
                      : const SizedBox(),
                  TagCard(
                    isAppear: isWalletAppear,
                    operationType: operation.type,
                    text: operation.wallet!.name,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/cards/tag_card.dart';
import '../../../../core/components/widgets/sheet.dart';
import '../../../../core/utils/app_context.dart';
import '../../../onboarding/presentation/widgets/delete_check_bottom_sheet.dart';
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
    return InkWell(
      onLongPress: () async {
        final result = await sheet(
            context: context,
            content: DeleteCheckBottomSheet(
              type: "Operation",
              operation: operation,
            ));
        if (result) {
          context.read<OperationBloc>().add(
                DeleteOperationEvent(operation: operation),
              );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      operation.name,
                      style: context.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                      DateFormat("yyyy-MM-dd").format(operation.date),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      operation.value.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TagCard(
                    isAppear: isCategoryAppear,
                    operationType: operation.type,
                    text: operation.category!.name,
                  ),
                  isCategoryAppear
                      ? const SizedBox(height: 8)
                      : const SizedBox(),
                  TagCard(
                    isAppear: isWalletAppear,
                    operationType: operation.type,
                    text: operation.wallet!.name,
                  ),
                  // IconButton(
                  //   onPressed: () => context
                  //       .read<OperationBloc>()
                  //       .add(DeleteOperationEvent(operation: operation)),
                  //   icon: Icon(
                  //     Icons.delete_outline,
                  //     color: context.colors.error,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

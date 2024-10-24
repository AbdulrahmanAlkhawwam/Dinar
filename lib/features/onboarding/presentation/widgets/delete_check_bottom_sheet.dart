import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../../app/domain/entities/operation_type.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../operations/domain/entities/operation.dart';
import '../../../wallets/domain/entities/wallet.dart';
import '../../../../core/constants/res.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/components/buttons/secondary_button.dart';

class DeleteCheckBottomSheet extends StatelessWidget {
  const DeleteCheckBottomSheet({
    super.key,
    required this.type,
    this.category,
    this.wallet,
    this.operation,
  });

  final String type;
  final Category? category;
  final Wallet? wallet;
  final Operation? operation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom + 32,
        top: 32,
        left: 24,
        right: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: context.colors.errorContainer,
              child: SvgPicture.asset(
                Res.delete,
                width: 44,
                height: 44,
                alignment: AlignmentDirectional.center,
                color: context.colors.error,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "Delete $type",
            style: TextStyle(
              color: context.colors.onTertiaryContainer,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        "Are you sure you want to delete $type which name is ",
                    style: TextStyle(
                      color: context.colors.onTertiaryContainer,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: type == "Category"
                        ? category?.name
                        : type == "wallet"
                            ? wallet?.name
                            : operation?.name,
                    style: TextStyle(
                      color: type == "Category" &&
                                  category?.type == OperationType.income ||
                              type == "Operation" &&
                                  operation?.type == OperationType.income ||
                              type == "wallet"
                          ? context.colors.primary
                          : context.colors.error,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: type != "wallet" ? " and it's type is " : "",
                    style: TextStyle(
                      color: context.colors.onTertiaryContainer,
                      fontSize: 16,
                    ),
                  ),
                  type != "wallet"
                      ? TextSpan(
                          text: type == "Category"
                              ? category?.type.name
                              : operation?.type.name,
                          style: TextStyle(
                            color: category?.type == OperationType.income ||
                                    operation?.type == OperationType.income
                                ? context.colors.primary
                                : context.colors.error,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const TextSpan(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          SecondaryButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            text: "delete".toUpperCase(),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text("back"),
          ),
        ],
      ),
    );
  }
}

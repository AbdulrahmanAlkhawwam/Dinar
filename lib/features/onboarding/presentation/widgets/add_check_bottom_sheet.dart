import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/strings.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../wallets/domain/entities/wallet.dart';
import '../../../../core/constants/res.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/components/buttons/secondary_button.dart';

class AddCheckBottomSheet extends StatelessWidget {
  const AddCheckBottomSheet({
    super.key,
    required this.type,
    required this.category,
    required this.wallet,
  });

  final String type;
  final Category? category;
  final Wallet? wallet;

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
              backgroundColor: context.colors.onPrimary,
              child: SvgPicture.asset(
                Res.check,
                width: 32,
                height: 32,
                alignment: AlignmentDirectional.center,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            texts[type]["title"],
            style: context.textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "Are you sure you want to add new $type with ",
                    style: context.textTheme.bodySmall,
                  ),
                  TextSpan(
                      text: type == texts["app"]["cat_type"]
                          ? category?.name
                          : wallet?.name,
                      style: context.textTheme.titleSmall?.copyWith(
                        color: type == texts["app"]["cat_type"] &&
                                    category?.type == OperationType.income ||
                                type == texts["app"]["wal_type"]
                            ? context.colors.primary
                            : context.colors.error,
                      )),
                  TextSpan(
                    text: type == texts["app"]["cat_type"]
                        ? " as name and "
                        : " as name ",
                    style: context.textTheme.bodySmall,
                  ),
                  type == texts["app"]["cat_type"]
                      ? TextSpan(
                          text: category?.type.name,
                          style: context.textTheme.titleSmall?.copyWith(
                            color: category?.type == OperationType.income
                                ? context.colors.primary
                                : context.colors.error,
                          ))
                      : const TextSpan(),
                  type == texts["app"]["cat_type"]
                      ? TextSpan(
                          text: " as type",
                          style: context.textTheme.bodySmall,
                        )
                      : const TextSpan(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          SecondaryButton(
            text:
                texts["app"]["checker"]["pri_button"] ?? texts["app"]["e_msg"],
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(
              texts["app"]["checker"]["sec_button"] ?? texts["app"]["e_msg"],
            ),
          ),
        ],
      ),
    );
  }
}

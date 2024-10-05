import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/app/domain/entities/operation_type.dart';

import '../../../../core/components/buttons/secondary_button.dart';
import '../../../../core/constants/res.dart';
import '../../../categories/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../wallets/domain/entities/wallet.dart';

class CheckBottomSheet extends StatelessWidget {
  const CheckBottomSheet({
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
              backgroundColor: Colors.white,
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
            "Create your $type",
            style: TextStyle(
              color: context.colors.onTertiaryContainer,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "Are you sure you want to add new $type with ",
                    style: TextStyle(
                      color: context.colors.onTertiaryContainer,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: type == "Category" ? category?.name : wallet?.name,
                    style: TextStyle(
                        color: type == "Category" &&
                                    category?.type == OperationType.income ||
                                type == "Wallet"
                            ? context.colors.primary
                            : context.colors.error,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: type == "Category" ? " as name and " : " as name ",
                    style: TextStyle(
                      color: context.colors.onTertiaryContainer,
                      fontSize: 16,
                    ),
                  ),
                  type == "Category"
                      ? TextSpan(
                          text: category?.type.name,
                          style: TextStyle(
                            color: category?.type == OperationType.income
                                ? context.colors.primary
                                : context.colors.error,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const TextSpan(),
                  type == "Category"
                      ? TextSpan(
                          text: " as type",
                          style: TextStyle(
                            color: context.colors.onTertiaryContainer,
                            fontSize: 16,
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

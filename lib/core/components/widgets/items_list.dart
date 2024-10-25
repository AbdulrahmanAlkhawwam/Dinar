import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/categories/presentation/widgets/category_item.dart';
import 'package:Dinar/features/wallets/presentation/widgets/wallet_item.dart';
import 'package:flutter/material.dart';

import '../../../features/operations/presentation/widgets/operation_item.dart';

class ItemsList extends StatelessWidget {
  final List<dynamic> list;
  // final String title;
  final String type;

  final MaterialPageRoute route;

  const ItemsList({
    super.key,
    required this.list,
    required this.type,
    // required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              physics: RangeMaintainingScrollPhysics(),
              itemBuilder: (context, index) => switch (type) {
                "operation" => OperationItem(operation: list[index]),
                "category" =>
                  CategoryItem(category: list[index], isHorizontal: false),
                "wallet" =>
                  WalletItem(wallet: list[index], isHorizontal: false),
                _ => const SizedBox(),
              },
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: list.length,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => context.push(route),
            child: Container(
              decoration: BoxDecoration(
                  color: context.colors.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(10)),
              height: 30,
              width: double.infinity,
              child: Center(
                  child: Text(
                "show more",
                style: context.textTheme.labelLarge
                    ?.copyWith(color: context.colors.primaryContainer),
              )),
            ),
          )
        ],
      ),
    );
  }
}

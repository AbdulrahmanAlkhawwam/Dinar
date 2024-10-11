import 'package:Dinar/core/components/cards/list_card.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/widgets/sheet.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../onboarding/presentation/widgets/delete_check_bottom_sheet.dart';
import '../../domain/entities/category.dart';
import '../manager/categories_bloc.dart';

class CategoryItem extends StatelessWidget {
  final bool isHorizontal;
  final Category category;

  const CategoryItem({
    super.key,
    required this.isHorizontal,
    required this.category,
  });

  Widget _name(BuildContext context) => Text(
        category.name.toUpperCase(),
        style: context.textTheme.titleMedium,
      );

  Widget _type(BuildContext context) => Text(
        category.type.name,
        style: context.textTheme.labelSmall?.copyWith(
          color: category.type == OperationType.income
              ? context.colors.primary
              : context.colors.error,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListCard(
        isHorizontal: isHorizontal,
        child: isHorizontal
            ? Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _name(context),
                      _type(context),
                      Center(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          "Total : ${category.balance ?? 0.0}",
                          style: context.textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _name(context),
                            _type(context),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final result = await sheet(
                              context: context,
                              content: DeleteCheckBottomSheet(
                                  type: "Category",
                                  category: category,
                                  wallet: null));
                          if (result) {
                            context.read<CategoriesBloc>().add(
                                  DeleteCategoryEvent(category: category),
                                );
                          }
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          color: context.colors.error,
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}

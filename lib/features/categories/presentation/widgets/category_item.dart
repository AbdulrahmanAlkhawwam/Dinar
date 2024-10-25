import 'package:Dinar/core/components/cards/list_card.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/categories/presentation/pages/category_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/widgets/sheet.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../onboarding/presentation/widgets/delete_check_bottom_sheet.dart';
import '../../../operations/presentation/manager/operation_bloc.dart';
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
    return InkWell(
      onTap: () {
        context
            .read<OperationBloc>()
            .add(GetCategoryOperationEvent(category: category));
        context.push(MaterialPageRoute(
          builder: (context) => CategoryDetailsScreen(
            category: category,
          ),
        ));
      },
      child: ListCard(
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
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(12),
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
                      ],
                    ),
                  ),
                )),
    );
  }
}

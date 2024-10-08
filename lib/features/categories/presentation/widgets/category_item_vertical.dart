import 'package:Dinar/core/components/widgets/sheet.dart';
import 'package:Dinar/features/categories/presentation/manager/categories_bloc.dart';
import 'package:Dinar/features/onboarding/presentation/widgets/delete_check_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/domain/entities/operation_type.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';
import '../../domain/entities/category.dart';

class CategoryItemVertical extends StatelessWidget {
  final Category category;

  const CategoryItemVertical({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: context.colors.onSecondary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: context.colors.secondaryContainer,
            width: 3,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        category.name,
                        style: context.textTheme.titleMedium,
                      ),
                      Text(
                        category.type.name,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: category.type == OperationType.income
                              ? context.colors.primary
                              : context.colors.error,
                        ),
                      ),
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
        ),
      ),
    );
  }
}

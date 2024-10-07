import 'package:flutter/material.dart';

import '../../domain/entities/category.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/constants/colors.dart';

class CategoryItemHorizontal extends StatelessWidget {
  final Category category;

  const CategoryItemHorizontal({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        gradient: GradientLightColor.cardColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: context.colors.secondaryContainer,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                category.name.toUpperCase(),
                style: context.textTheme.titleMedium,
              ),
              Text(
                category.type.name,
                style: context.textTheme.labelSmall?.copyWith(
                  color: category.type == OperationType.payment
                      ? context.colors.error
                      : context.colors.primary,
                ),
              ),
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
      ),
    );
  }
}

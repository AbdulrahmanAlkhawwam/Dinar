import '../../../app/domain/entities/operation_type.dart';
import '../../../categories/domain/entities/category.dart';
import 'package:flutter/material.dart';

import 'category_item_horizontal.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryItemHorizontal(
          category: Category(
            name: "name",
            type: OperationType.income,
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemCount: 15,
      ),
    );
  }
}

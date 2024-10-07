import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/categories/presentation/manager/categories_bloc.dart';
import 'package:Dinar/features/categories/presentation/pages/categories_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../../categories/presentation/widgets/category_item_horizontal.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.read<CategoriesBloc>().incomeCategories +
        context.read<CategoriesBloc>().paymentCategories;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              "Categories",
              style: context.textTheme.titleSmall,
            ),
            const Spacer(),
            TextButton(
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                  Size(
                    double.infinity,
                    double.minPositive,
                  ),
                ),
              ),
              onPressed: () => context.push(
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(),
                ),
              ),
              child: Text(
                "show more",
                style: context.textTheme.labelSmall,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 130,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 24),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CategoryItemHorizontal(
                category: categories[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemCount: categories.length,
            ),
          ),
        ),
      ],
    );
  }
}

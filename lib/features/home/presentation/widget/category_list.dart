import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/components/widgets/skeleton.dart';
import '../../../../core/utils/app_context.dart';
import '../../../categories/presentation/manager/categories_bloc.dart';
import '../../../categories/presentation/pages/categories_screen.dart';
import '../../../categories/presentation/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            switch (state) {
              CategoriesLoading _ => Shimmer.fromColors(
                  baseColor: context.colors.outline.withOpacity(0.25),
                  highlightColor: context.colors.surface.withOpacity(0.25),
                  enabled: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Skeleton(height: 112, width: 200, borderRadius: 10),
                          const SizedBox(width: 16),
                          Skeleton(height: 112, width: 100, borderRadius: 10),
                          const SizedBox(width: 16),
                          Skeleton(height: 112, width: 150, borderRadius: 10),
                          const SizedBox(width: 16),
                          Skeleton(height: 112, width: 130, borderRadius: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              CategoriesLoaded _ => SizedBox(
                  height: 96,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CategoryItem(
                        category: (state.paymentCategories +
                            state.incomeCategories)[index],
                        isHorizontal: true,
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 16),
                      itemCount: (state.incomeCategories.length +
                          state.paymentCategories.length),
                    ),
                  ),
                ),
              _ => const SizedBox()
            },
          ],
        );
      },
    );
  }
}

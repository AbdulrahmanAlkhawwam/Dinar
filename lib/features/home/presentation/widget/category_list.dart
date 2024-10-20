import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/components/widgets/skeleton.dart';
import '../../../../core/utils/app_context.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../categories/presentation/manager/categories_bloc.dart';
import '../../../categories/presentation/pages/categories_screen.dart';
import '../../../categories/presentation/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Category> categories =
        context.read<CategoriesBloc>().incomeCategories +
            context.read<CategoriesBloc>().paymentCategories;

    return BlocListener<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        if (state is CategoriesLoaded) {
          categories = context.read<CategoriesBloc>().incomeCategories +
              context.read<CategoriesBloc>().paymentCategories;
        }
      },
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesInitial ||
              state is CategoriesError ||
              state is CategoriesLoaded &&
                  (state.incomeCategories + state.paymentCategories).isEmpty) {
            return const SizedBox();
          } else {
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
                              Skeleton(
                                  height: 112, width: 200, borderRadius: 10),
                              const SizedBox(width: 16),
                              Skeleton(
                                  height: 112, width: 100, borderRadius: 10),
                              const SizedBox(width: 16),
                              Skeleton(
                                  height: 112, width: 150, borderRadius: 10),
                              const SizedBox(width: 16),
                              Skeleton(
                                  height: 112, width: 130, borderRadius: 10),
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
                            category: categories[index],
                            isHorizontal: true,
                          ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 16),
                          itemCount: categories.length,
                        ),
                      ),
                    ),
                  _ => const SizedBox()
                },
              ],
            );
          }
        },
      ),
    );
  }
}

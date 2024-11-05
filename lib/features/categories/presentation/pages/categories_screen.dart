import 'package:Dinar/core/components/widgets/sheet.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:Dinar/features/categories/presentation/widgets/categories_bottom_sheet.dart';
import 'package:Dinar/features/categories/presentation/widgets/category_item.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

import '../../../onboarding/presentation/widgets/add_check_bottom_sheet.dart';
import '../manager/categories_bloc.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Category> incomeCategories =
        context.read<CategoriesBloc>().incomeCategories;
    List<Category> paymentCategories =
        context.read<CategoriesBloc>().paymentCategories;

    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        if (state is CategoriesError) {
          context.showErrorSnackBar(massage: state.message.value);
        }
        if (state is CategoriesLoaded) {
          incomeCategories = context.read<CategoriesBloc>().incomeCategories;
          paymentCategories = context.read<CategoriesBloc>().paymentCategories;
        }
        if (state is CategoryDeleted) {
          context.showSuccessSnackBar(
              massage: "${state.category.name} : was deleted");
        }
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () =>
                    (incomeCategories + paymentCategories).isNotEmpty
                        ? context.pop()
                        : context.showErrorSnackBar(
                            massage: "you should add new category"),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              title: const Text("Categories"),
              actions: [
                IconButton(
                  onPressed: () async {
                    final category = await sheet(
                        context: context, content: CategoriesBottomSheet());
                    if (category != null) {
                      final result = await sheet(
                        context: context,
                        content: AddCheckBottomSheet(
                          type: "Category",
                          category: category,
                          wallet: null,
                        ),
                      );
                      if (result) {
                        context
                            .read<CategoriesBloc>()
                            .add(AddCategoryEvent(category: category));
                      }
                    }
                  },
                  icon: Icon(Icons.add),
                )
              ],
            ),
            body: Column(
              children: [
                TabBar(
                  dividerColor: context.colors.surface,
                  onTap: (value) => setState(() => index = value),
                  labelStyle: context.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                  tabs: [
                    Tab(text: "(${incomeCategories.length}) incomes"),
                    Tab(text: "(${paymentCategories.length}) payments"),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CategoryItem(
                          isHorizontal: false,
                          category: switch (this.index) {
                            0 => incomeCategories[index],
                            _ => paymentCategories[index],
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: switch (index) {
                      0 => incomeCategories.length,
                      _ => paymentCategories.length,
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

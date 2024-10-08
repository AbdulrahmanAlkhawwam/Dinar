import 'package:Dinar/core/components/widgets/sheet.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/app/presentation/pages/loading.dart';
import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:Dinar/features/categories/presentation/widgets/categories_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../categories/presentation/widgets/category_item_vertical.dart';
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
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Category> incomeCategories =
        context.read<CategoriesBloc>().incomeCategories;
    List<Category> paymentCategories =
        context.read<CategoriesBloc>().paymentCategories;
    List<Category> allCategories = incomeCategories + paymentCategories;

    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        if (state is CategoriesError) {
          context.showErrorSnackBar(massage: state.message.value);
        }
        if (state is CategoriesLoaded) {
          incomeCategories = context.read<CategoriesBloc>().incomeCategories;
          paymentCategories = context.read<CategoriesBloc>().paymentCategories;
          allCategories = incomeCategories + paymentCategories;
        }
        if (state is CategoryDeleted) {
          context.showSuccessSnackBar(
              massage: "${state.category.name} : was deleted");
        }
      },
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return Loading();
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => allCategories.isNotEmpty
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
                onTap: (value) => setState(() {}),
                labelStyle: context.textTheme.titleSmall,
                controller: controller,
                tabs: [
                  Tab(text: "(${allCategories.length}) All"),
                  Tab(text: "(${incomeCategories.length}) incomes"),
                  Tab(text: "(${paymentCategories.length}) payments"),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    switch (controller.index) {
                      case 0:
                        return CategoryItemVertical(
                          category: allCategories[index],
                        );
                      case 1:
                        return CategoryItemVertical(
                          category: incomeCategories[index],
                        );
                      case 2:
                        return CategoryItemVertical(
                          category: paymentCategories[index],
                        );
                    }
                    return const SizedBox();
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemCount: controller.index == 0
                      ? allCategories.length
                      : controller.index == 1
                          ? incomeCategories.length
                          : paymentCategories.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:Dinar/core/utils/app_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../categories/presentation/widgets/category_item_vertical.dart';
import 'package:flutter/material.dart';

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
    final incomeCategories = context.read<CategoriesBloc>().incomeCategories;
    final paymentCategories = context.read<CategoriesBloc>().paymentCategories;
    final allCategories = incomeCategories + paymentCategories;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Categories"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
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
              separatorBuilder: (context, index) => const SizedBox(height: 15),
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
  }
}

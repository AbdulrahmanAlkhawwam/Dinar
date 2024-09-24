import 'package:Dinar/src/core/utils/app_context.dart';
import 'package:Dinar/src/features/app/domain/entities/operation_type.dart';
import 'package:Dinar/src/features/categories/domain/entities/category.dart';
import 'package:Dinar/src/features/categories/presentation/widgets/category_item_vertical.dart';
import 'package:flutter/material.dart';

import '../../../payments/presentation/widgets/payment_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = [
      Category(
        "",
        name: "food",
        type: OperationType.payment,
      ),
      Category(
        "",
        name: "food",
        type: OperationType.payment,
      ),
      Category(
        "",
        name: "food",
        type: OperationType.payment,
      ),
      Category(
        "",
        name: "food",
        type: OperationType.payment,
      ),
      Category(
        "",
        name: "food",
        type: OperationType.payment,
      ),
      Category(
        "",
        name: "food",
        type: OperationType.payment,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Categories"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) =>
            CategoryItemVertical(category: categories[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: categories.length,
      ),
    );
  }
}

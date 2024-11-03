import 'package:Dinar/core/components/cards/empty_card.dart';
import 'package:Dinar/core/constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/widgets/error_content.dart';
import '../../../../core/components/widgets/sheet.dart';
import '../../../../core/constants/styles.dart';
import '../../../../core/utils/app_context.dart';
import '../../../onboarding/presentation/widgets/delete_check_bottom_sheet.dart';
import '../../../operations/presentation/manager/operation_bloc.dart';
import '../../../operations/presentation/widgets/operation_item.dart';
import '../../domain/entities/category.dart';
import '../manager/categories_bloc.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final Category category;

  const CategoryDetailsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        if (state is CategoryDeleted && category.id == state.category.id) {
          context.pop();
        }
        if (state is CategoriesError) {
          context.showErrorSnackBar(massage: state.message.value.toString());
        }
      },
      child: BlocBuilder<OperationBloc, OperationState>(
        builder: (context, state) {
          getBalance() {
            double sum = 0;
            if (state is OperationLoaded) {
              for (var operation in state.operations) {
                if (operation.categoryId == category.id) {
                  sum += operation.value;
                }
              }
            }
            return sum;
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(category.name.toUpperCase()),
              actions: [
                IconButton(
                  onPressed: () async {
                    final result = await sheet(
                        context: context,
                        content: DeleteCheckBottomSheet(
                            type: texts["app"]["cat_type"],
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
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.colors.secondary,
                        width: border,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: context.colors.primaryContainer,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("name : ${category.name}"),
                          const SizedBox(height: 4),
                          Text("type : ${category.type.name}"),
                          const SizedBox(height: 4),
                          Text("balance : ${getBalance()} \$"),
                        ],
                      ),
                    ),
                  ),
                ),
                state is OperationLoaded &&
                        state.operations
                            .where(
                                (element) => element.categoryId == category.id)
                            .isEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: EmptyCard(
                          mainText: "Operations is ",
                          text: "Empty",
                        ),
                      )
                    : Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                              child: Text(
                                "Operations",
                                style: context.textTheme.titleMedium,
                              ),
                            ),
                            const SizedBox(height: 8),
                            switch (state) {
                              OperationError _ => ErrorContent(
                                  message: 'Error',
                                  errorMessage: Text(state.message.value),
                                ),
                              OperationLoaded _ => Expanded(
                                  child: ListView.separated(
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: OperationItem(
                                        isCategoryAppear: false,
                                        operation: state.operations
                                            .where((e) =>
                                                e.categoryId == category.id)
                                            .toList()[index],
                                      ),
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 15),
                                    itemCount: state.operations
                                        .where(
                                            (e) => e.categoryId == category.id)
                                        .toList()
                                        .length,
                                  ),
                                ),
                              _ => const SizedBox(),
                            },
                            const SizedBox(height: 16)
                          ],
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:Dinar/core/components/widgets/error_content.dart';
import 'package:Dinar/core/constants/styles.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/components/widgets/sheet.dart';
import '../../../../core/components/widgets/skeleton.dart';
import '../../../onboarding/presentation/widgets/delete_check_bottom_sheet.dart';
import '../../../operations/presentation/manager/operation_bloc.dart';
import '../../../operations/presentation/widgets/operation_item.dart';
import '../manager/categories_bloc.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final Category category;

  const CategoryDetailsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        if (state is CategoryDeleted) {
          context.pop();
        }
      },
      child: BlocBuilder<OperationBloc, OperationState>(
        builder: (context, state) {
          _getBalance() {
            double sum = 0;
            if (state is CategoryOperationLoaded) {
              for (var operation in state.operations) {
                sum += operation.value;
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
                            type: "Category",
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
                        color: context.colors.primaryContainer),
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
                          Text("balance : ${_getBalance()} \$"),
                        ],
                      ),
                    ),
                  ),
                ),
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
                      message: 'Empty',
                      errorMessage: Text(state.message.value),
                    ),
                  CategoryOperationLoaded _ => Expanded(
                        child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: OperationItem(
                            isCategoryAppear: false,
                            operation: state.operations[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 15),
                      itemCount: state.operations.length,
                    )),
                  OperationLoading _ => Shimmer.fromColors(
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
                                  height: 110, width: 130, borderRadius: 10),
                              const SizedBox(width: 16),
                              Skeleton(
                                  height: 110, width: 200, borderRadius: 10),
                              const SizedBox(width: 16),
                              Skeleton(
                                  height: 110, width: 100, borderRadius: 10),
                              const SizedBox(width: 16),
                              Skeleton(
                                  height: 110, width: 150, borderRadius: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  _ => const SizedBox(),
                },
                const SizedBox(height: 16)
              ],
            ),
          );
        },
      ),
    );
  }
}

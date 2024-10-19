import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';
import '../../../operations/presentation/pages/operations_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Operations"),
        actions: [
          IconButton(
            onPressed: () /*async*/ {
              context.showSuccessSnackBar(
                  massage:
                      "this button do not thing , we will fix it soon  ;)");
              // TODO : fix this
              // final category = await sheet(
              //     context: context, content: CategoriesBottomSheet());
              // if (category != null) {
              //   final result = await sheet(
              //     context: context,
              //     content: AddCheckBottomSheet(
              //       type: "Category",
              //       category: category,
              //       wallet: null,
              //     ),
              //   );
              //   if (result) {
              //     context
              //         .read<OperationBloc>()
              //         .add(AddOperationEvent(operation: category));
              //   }
              // }
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: OperationsScreen(),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../manager/income_bloc.dart';
import '../widgets/income_item.dart';
import '../../../app/presentation/pages/loading.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/components/widgets/error_content.dart';

class IncomesScreen extends StatelessWidget {
  const IncomesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget mainContent;
    return BlocBuilder<IncomeBloc, IncomeState>(
      builder: (context, state) {
        switch (state) {
          case IncomeError _:
            mainContent = ErrorContent(
              message: state.message.value,
              errorMessage: Icon(
                Icons.error,
                color: context.colors.error,
                size: 80,
              ),
            );
          case IncomeLoaded _:
            if (state.incomes.isEmpty) {
              mainContent = ErrorContent(
                message: "there are no Item to display",
                errorMessage: Text(
                  "404",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 76,
                  ),
                ),
              );
            } else {
              mainContent = ListView.separated(
                itemBuilder: (context, index) =>
                    IncomeItem(income: state.incomes[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: state.incomes.length,
              );
            }

          default:
            mainContent = SizedBox();
        }
        if (state is IncomeLoading || state is IncomeInitial) {
          return Scaffold(
            body: Loading(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              title: const Text("Incomes"),
            ),
            body: mainContent,
          );
        }
      },
    );
  }
}

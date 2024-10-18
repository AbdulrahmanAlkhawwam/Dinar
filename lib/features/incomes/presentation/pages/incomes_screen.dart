import 'package:Dinar/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../manager/income_bloc.dart';
import '../widgets/income_item.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/components/widgets/error_content.dart';

class IncomesScreen extends StatelessWidget {
  const IncomesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget mainContent;
    return BlocConsumer<IncomeBloc, IncomeState>(
      listener: (context, state) {
        if (state is IncomeLoading || state is IncomeInitial) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
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
                  "Empty",
                  style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 64,
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
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            title: const Text("Incomes"),
          ),
          body: mainContent,
        );
      },
    );
  }
}

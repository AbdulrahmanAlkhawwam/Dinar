import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../manager/payment_bloc.dart';
import '../widgets/payment_item.dart';
import '../../../app/presentation/pages/loading.dart';
import '../../../../core/utils/app_context.dart';
import '../../../../core/components/widgets/error_content.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget mainContent;
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        switch (state) {
          case PaymentError _:
            mainContent = ErrorContent(
              message: state.message.value,
              errorMessage: Icon(
                Icons.error,
                color: context.colors.error,
                size: 80,
              ),
            );
          case PaymentLoaded _:
            if (state.payments.isEmpty) {
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
                    PaymentItem(payment: state.payments[index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemCount: state.payments.length,
              );
            }

          default:
            mainContent = SizedBox();
        }
        if (state is PaymentLoading || state is PaymentInitial) {
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
              title: const Text("Payments"),
            ),
            body: mainContent,
          );
        }
      },
    );
  }
}

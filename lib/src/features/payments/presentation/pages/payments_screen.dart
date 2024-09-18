import 'package:core/styles/colors/main_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/payment_item.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("we are in payments screen");
    return Scaffold(
      backgroundColor: MainColors.mintCream,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: const Text("title"),
        centerTitle: true,
        backgroundColor: MainColors.mintCream,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => const PaymentItem(),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: 10,
      ),
    );
  }
}

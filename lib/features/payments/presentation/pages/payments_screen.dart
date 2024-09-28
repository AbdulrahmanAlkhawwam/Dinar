import 'package:flutter/material.dart';

import '../../domain/entities/payment.dart';
import '../widgets/payment_item.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // dome data .... but we should get data from bloc in next time
    List<Payment> payments = [
      Payment(
        "dsaflkja;lkdvj213543",
        name: "age asdl;fkjas;dlfkjad;sflkjad;lfskja;dsflk",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Payment(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description:
            "asd;lfkjasd;lkfja;lskdfj;lasdkfjla;skdjf;laskdjf;laksdjf;laksdjf;lkasjdf;lkasjdf;lkajsdf;lkaj",
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Payment(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Payment(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Payment(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Payment(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Payment(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Payment(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("Payments"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => PaymentItem(payment: payments[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: payments.length,
      ),
    );
  }
}

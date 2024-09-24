import 'package:Dinar/src/features/incomes/domain/entities/income.dart';
import 'package:Dinar/src/features/incomes/presentation/widgets/income_item.dart';
import 'package:flutter/material.dart';

class IncomesScreen extends StatelessWidget {
  const IncomesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // dome data .... but we should get data from bloc in next time
    List<Income> incomes = [
      Income(
        "dsaflkja;lkdvj213543",
        name: "age asdl;fkjas;dlfkjad;sflkjad;lfskja;dsflk",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Income(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description:
            "asd;lfkjasd;lkfja;lskdfj;lasdkfjla;skdjf;laskdjf;laksdjf;laksdjf;lkasjdf;lkasjdf;lkajsdf;lkaj",
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Income(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Income(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Income(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Income(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Income(
        "dsaflkja;lkdvj213543",
        name: "age",
        value: 15000,
        description: null,
        categoryId: "109348701",
        walletId: "2304987143",
        date: DateTime.now(),
      ),
      Income(
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
        title: const Text("Incomes"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => IncomeItem(income: incomes[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemCount: incomes.length,
      ),
    );
  }
}

import 'package:Dinar/core/components/buttons/float_button.dart';
import 'package:Dinar/core/utils/app_context.dart';

import '../../../../core/constants/colors.dart';

import '../widget/category_list.dart';
import '../../../incomes/presentation/widgets/income_chart.dart';
import '../../../payments/presentation/widgets/payment_chart.dart';
import '../widget/wallet_list.dart';
import '../../../../core/styles/colors/main_colors.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final int balance = 152758000;
  final int monthlyAverage = 15000000;
  final int usage = 10215000;

  @override
  Widget build(BuildContext context) {
    String myNumber = ((usage / monthlyAverage) * 100.00).toString();
    print(usage / monthlyAverage);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                  child: Text(
                    textAlign: TextAlign.start,
                    "Good \nMorning",
                    style: context.textTheme.bodyLarge,
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: context.gradient.fixedSecondaryColor,
                    border: Border.all(
                      color: MainColors.forestGreen,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "${DateFormat.MMMM().format(DateTime.now())} ${DateFormat.y().format(DateTime.now())}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: MainColors.darkTeal,
                                fontSize: 24),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: "Balance : ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: balance.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                const TextSpan(
                                  text: "\nmonthly average : ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: monthlyAverage.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const TextSpan(
                                  text: "\nyour usage : ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: usage.toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                color: MainColors.darkTeal,
                                backgroundColor: MainColors.teaGreen,
                                minHeight: 16,
                                borderRadius: BorderRadius.circular(20),
                                value: usage / monthlyAverage,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text("${myNumber.substring(0, 2)} %"),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const WalletList(),
                const IncomeChart(),
                const SizedBox(height: 16),
                const PaymentChart(),
                CategoryList(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: FloatButton(
          onPressed: () {
            print("*** click more ***");
          },
          text: "more".toUpperCase(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

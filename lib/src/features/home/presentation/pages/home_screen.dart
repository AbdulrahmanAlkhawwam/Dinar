import '../../../categories/presentation/widgets/category_list.dart';
import '../../../incomes/presentation/widgets/income_chart.dart';
import '../../../payments/presentation/widgets/payment_chart.dart';
import '../../../wallets/presentation/widgets/wallet_list.dart';
import '../../../../core/components/buttons/primary_button.dart';
import '../../../../core/styles/colors/light_colors.dart';
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
    print("we are in home screen");
    print(usage / monthlyAverage);
    return Scaffold(
      backgroundColor: MainColors.mintCream,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.start,
                    "Good \nMorning",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LightColors.secondaryButtonColorEnabled,
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
                const SizedBox(
                  height: 160,
                  child: WalletList(),
                ),
                const IncomeChart(),
                const SizedBox(
                  height: 16,
                ),
                const PaymentChart(),
                const SizedBox(
                  height: 150,
                  child: CategoryList(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: PrimaryButton(
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

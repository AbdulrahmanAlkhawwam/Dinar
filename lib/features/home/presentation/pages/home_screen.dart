import 'package:Dinar/core/components/cards/empty_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';
import '../../../categories/presentation/manager/categories_bloc.dart';
import '../../../operations/presentation/widgets/operation_chart.dart';
import '../../../wallets/presentation/manager/wallets_bloc.dart';
import '../widget/category_list.dart';
import '../widget/more_sheet.dart';
import '../widget/wallet_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int balance = 152758000;

  final int monthlyAverage = 15000000;

  final int usage = 10215000;

  @override
  void initState() {
    context.read<CategoriesBloc>().add(LoadCategoriesEvent());
    context.read<WalletsBloc>().add(LoadWalletsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String myNumber = ((usage / monthlyAverage) * 100.00).toString();
    return MultiBlocListener(
      listeners: [
        BlocListener<CategoriesBloc, CategoriesState>(
          listener: (context, state) {
            // if (state is CategoriesLoading) {
            //   context.loaderOverlay.show();
            // } else {
            //   context.loaderOverlay.hide();
            // }
          },
        ),
        BlocListener<WalletsBloc, WalletsState>(
          listener: (context, state) {
            // if (state is WalletsLoading) {
            //   context.loaderOverlay.show();
            // } else {
            //   context.loaderOverlay.hide();
            // }
          },
        )
      ],
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                    child: Row(
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          "Good \nMorning",
                          style: context.textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        IconButton.filled(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => MoreSheet(),
                              sheetAnimationStyle: AnimationStyle(
                                duration: Duration(milliseconds: 1),
                                reverseDuration: Duration(milliseconds: 1),
                              ),
                              backgroundColor: Colors.transparent,
                              constraints: BoxConstraints(
                                minHeight: context.height,
                                minWidth: context.width,
                              ),
                              isScrollControlled: true,
                            );
                          },
                          icon: Icon(Icons.add),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: context.gradient.fixedSecondaryColor,
                      border: Border.all(
                        color: context.colors.secondary,
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
                                  color: context.colors.onTertiaryContainer,
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
                                  color: context.colors.onTertiaryContainer,
                                  backgroundColor: context.colors.primary,
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
                  const EmptyCard(text: "Incomes is "),
                  // const OperationChart(),
                  const SizedBox(height: 16),
                  const OperationChart(),
                  const SizedBox(height: 16),
                  const CategoryList(),
                ],
              ),
            ),
          ),
        ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 32.0),
        //   child: FloatButton(
        //     onPressed: ,
        //     text: "More",
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

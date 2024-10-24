import 'package:Dinar/app.dart';
import 'package:Dinar/core/components/cards/empty_card.dart';
import 'package:Dinar/features/app/domain/entities/operation_type.dart';
import 'package:Dinar/features/home/presentation/widget/history_list.dart';
import 'package:Dinar/features/home/presentation/widget/statistics_card.dart';
import 'package:Dinar/features/operations/presentation/manager/operation_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';
import '../../../categories/presentation/manager/categories_bloc.dart';
import '../../../operations/presentation/widgets/operation_chart.dart';
import '../../../wallets/presentation/manager/wallets_bloc.dart';
import '../widget/category_list.dart';
import '../widget/wallet_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<CategoriesBloc>().add(LoadCategoriesEvent());
    context.read<WalletsBloc>().add(LoadWalletsEvent());
    context.read<OperationBloc>().add(LoadOperationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          DateFormat("dd MMMM yyyy").format(DateTime.now()),
          style: context.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StatisticsCard(),
                const WalletList(),
                const HistoryList(),
                const OperationChart(type: OperationType.income,),
                const SizedBox(height: 16),
                const OperationChart(type: OperationType.payment,),
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
    );
  }
}

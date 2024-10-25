import 'package:Dinar/features/home/presentation/widget/history_list.dart';
import 'package:Dinar/features/operations/presentation/manager/operation_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';
import '../../../categories/presentation/manager/categories_bloc.dart';
import '../../../wallets/presentation/manager/wallets_bloc.dart';
import '../widget/add_card.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const StatisticsCard(),
              const AddCard(),
              Divider(height: 2, color: context.colors.secondary),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  "Wallets",
                  style: context.textTheme.titleSmall,
                ),
              ),
              const Expanded(child: WalletList()),
              // const OperationChart(type: OperationType.income),
              // const SizedBox(height: 16),
              // const OperationChart(type: OperationType.payment),
              const SizedBox(height: 16),
              Divider(height: 2, color: context.colors.secondary),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  "Categories",
                  style: context.textTheme.titleSmall,
                ),
              ),
              const Expanded(child: CategoryList()),
              const SizedBox(height: 16),
              Divider(height: 2, color: context.colors.secondary),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Text(
                  "Histories",
                  style: context.textTheme.titleSmall,
                ),
              ),
              const HistoryList(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: (value) {
      //     context.read<WalletsBloc>().add(LoadWalletsEvent());
      //   },
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.add), label: "income"),
      //     BottomNavigationBarItem(icon: Icon(Icons.add), label: "payment"),
      //   ],
      // ),
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

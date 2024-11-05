import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_context.dart';
import '../../../categories/presentation/manager/categories_bloc.dart';
import '../../../operations/presentation/manager/operation_bloc.dart';
import '../../../wallets/presentation/manager/bloc/wallets_bloc.dart';
import '../widget/add_card.dart';
import '../widget/category_list.dart';
import '../widget/history_list.dart';
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
        toolbarHeight: 64,
        title: Text(
          DateFormat("dd MMMM yyyy").format(DateTime.now()),
          style: context.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: Column(
          children: [
            const AddCard(),
            const WalletList(),
            const CategoryList(),
            const Expanded(child: HistoryList()),
          ],
        ),
      ),
    );
  }
}

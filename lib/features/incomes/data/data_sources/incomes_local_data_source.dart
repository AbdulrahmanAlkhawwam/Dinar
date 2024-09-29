import 'package:Dinar/features/incomes/domain/entities/income.dart';

import '../models/Income_model.dart';
import '../../../wallets/data/models/wallet_model.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../../core/helpers/database_helper.dart';
import '../../../../core/constants/strings.dart';

abstract class IncomesLocalDataSource {
  Future<List<IncomeModel>> loadIncomes();

  Future<int> addIncome(IncomeModel incomeModel);
}

class IncomesLocalDataSourceImpl extends IncomesLocalDataSource {
  final DatabaseHelper db;

  IncomesLocalDataSourceImpl({required this.db});

  @override
  Future<List<IncomeModel>> loadIncomes() async {
    final incomesMap = await db.getData(
      operationsTable,
      where: "type = ?",
      args: ["income"],
    );
    final incomes =
        incomesMap.map((income) => IncomeModel.fromMap(income)).toList();

    final categoriesMap = await db.getData(categoriesTable);
    final categories =
        categoriesMap.map((category) => CategoryModel.fromMap(category));

    final walletsMap = await db.getData(walletsTable);
    final wallets = walletsMap.map((wallet) => WalletModel.fromMap(wallet));

    for (final income in incomes) {
      income.category = categories.firstWhere(
        (category) => category.id == income.categoryId,
      );
      income.wallet = wallets.firstWhere(
        (wallet) => wallet.id == income.walletId,
      );
    }
    return incomes;
  }

  @override
  Future<int> addIncome(IncomeModel incomeModel) async {
    final id = await db.insert(
      operationsTable,
      incomeModel.toMap(),
    );
    return id;
  }
}

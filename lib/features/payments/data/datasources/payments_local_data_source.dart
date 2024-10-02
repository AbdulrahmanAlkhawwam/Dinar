import '../models/payment_model.dart';
import '../../../wallets/data/models/wallet_model.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../../core/helpers/database_helper.dart';
import '../../../../core/constants/strings.dart';

abstract class PaymentsLocalDataSource {
  Future<List<PaymentModel>> loadPayments();

  Future<int> addPayment(paymentModel);
}

class PaymentsLocalDataSourceImpl extends PaymentsLocalDataSource {
  final DatabaseHelper db;

  PaymentsLocalDataSourceImpl({required this.db});

  @override
  Future<List<PaymentModel>> loadPayments() async {
    final paymentsMap = await db.getData(
      operationsTable,
      where: "type = ?",
      args: ["payment"],
    );
    final incomes =
        paymentsMap.map((income) => PaymentModel.fromMap(income)).toList();

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
  Future<int> addPayment(paymentModel) async {
    final id = await db.insert(
      operationsTable,
      paymentModel.toMap(),
    );
    return id;
  }
}

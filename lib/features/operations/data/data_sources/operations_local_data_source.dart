import '../../../../core/helpers/database_helper.dart';
import '../../../../core/constants/strings.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../wallets/data/models/wallet_model.dart';
import '../../../wallets/domain/entities/wallet.dart';
import '../models/operation_model.dart';

abstract class OperationsLocalDataSource {
  Future<List<OperationModel>> loadOperations({
    OperationType? type,
    Category? category,
    Wallet? wallet,
  });

  Future<int> addOperation(OperationModel operationModel);

  Future<void> deleteOperation(String id);
}

class OperationsLocalDataSourceImpl extends OperationsLocalDataSource {
  final DatabaseHelper db;

  OperationsLocalDataSourceImpl({required this.db});

  @override
  Future<List<OperationModel>> loadOperations(
      {OperationType? type, Category? category, Wallet? wallet}) async {
    final operationsMap = await db.getData(
      operationsTable,
      where: type != null
          ? "type = ?"
          : category != null
              ? "category_id = ?"
              : wallet != null
                  ? "wallet_id = ?"
                  : null,
      args: type != null
          ? [type.name]
          : category != null
              ? [category.id]
              : wallet != null
                  ? [wallet.id]
                  : null,
    );
    final operations =
        operationsMap.map((income) => OperationModel.fromMap(income)).toList();

    final categoriesMap = await db.getData(categoriesTable);
    final categories =
        categoriesMap.map((category) => CategoryModel.fromMap(category));

    final walletsMap = await db.getData(walletsTable);
    final wallets = walletsMap.map((wallet) => WalletModel.fromMap(wallet));

    for (final operation in operations) {
      operation.category = categories
          .firstWhere((category) => category.id == operation.categoryId);
      operation.wallet =
          wallets.firstWhere((wallet) => wallet.id == operation.walletId);
    }
    return operations;
  }

  @override
  Future<int> addOperation(OperationModel operationModel) async =>
      await db.insert(operationsTable, operationModel.toMap());

  @override
  Future<void> deleteOperation(String id) async =>
      await db.delete(operationsTable, where: "id = ?", args: [id]);
}

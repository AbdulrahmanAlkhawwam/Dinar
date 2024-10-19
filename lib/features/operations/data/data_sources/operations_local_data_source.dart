import '../../../../core/helpers/database_helper.dart';
import '../../../../core/constants/strings.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../wallets/data/models/wallet_model.dart';
import '../models/operation_model.dart';

abstract class OperationsLocalDataSource {
  Future<List<OperationModel>> loadOperations(OperationType type);

  Future<int> addOperation(OperationModel operationModel);
}

class OperationsLocalDataSourceImpl extends OperationsLocalDataSource {
  final DatabaseHelper db;

  OperationsLocalDataSourceImpl({required this.db});

  @override
  Future<List<OperationModel>> loadOperations(OperationType type) async {
    final operationsMap = await db.getData(
      operationsTable,
      where: "type = ?",
      args: [type.name],
    );
    final operations =
        operationsMap.map((income) => OperationModel.fromMap(income)).toList();

    final categoriesMap = await db.getData(categoriesTable);
    final categories =
        categoriesMap.map((category) => CategoryModel.fromMap(category));

    final walletsMap = await db.getData(walletsTable);
    final wallets = walletsMap.map((wallet) => WalletModel.fromMap(wallet));

    for (final operation in operations) {
      operation.category = categories.firstWhere(
        (category) => category.id == operation.categoryId,
      );
      operation.wallet = wallets.firstWhere(
        (wallet) => wallet.id == operation.walletId,
      );
    }
    return operations;
  }

  @override
  Future<int> addOperation(OperationModel operationModel) async {
    final id = await db.insert(
      operationsTable,
      operationModel.toMap(),
    );
    return id;
  }
}

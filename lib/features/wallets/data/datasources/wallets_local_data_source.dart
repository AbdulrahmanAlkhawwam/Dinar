import '../../../../core/constants/strings.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/helpers/database_helper.dart';
import '../models/wallet_model.dart';

abstract class WalletsLocalDataSource {
  Future<List<WalletModel>> loadWallets();

  Future<int> addWallet(WalletModel walletModel);

  Future<void> deleteWallet(String id);
}

class WalletsLocalDataSourceImpl extends WalletsLocalDataSource {
  final DatabaseHelper db;

  WalletsLocalDataSourceImpl({required this.db});

  @override
  Future<List<WalletModel>> loadWallets() async {
    final walletsMap = await db.getData(
      walletsTable,
    );
    final wallets =
        walletsMap.map((wallet) => WalletModel.fromMap(wallet)).toList();
    return wallets;
  }

  @override
  Future<int> addWallet(WalletModel walletModel) async {
    final id = await db.insert(
      walletsTable,
      walletModel.toMap(),
    );
    return id;
  }

  @override
  Future<void> deleteWallet(String id) async {
    final walletOperation = await db.getData(
      operationsTable,
      where: "wallet_id = ?",
      args: [id],
    );
    if (walletOperation.isEmpty) {
      await db.delete(
        walletsTable,
        where: "id = ?",
        args: [id],
      );
    } else {
      throw DeleteException("you can't delete this wallet !");
    }
  }
}

import '../models/wallet_model.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/helpers/database_helper.dart';

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
    await db.delete(
      walletsTable,
      where: "id = ?",
      args: [id],
    );
  }
}

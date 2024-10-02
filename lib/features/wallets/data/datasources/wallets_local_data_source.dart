import '../models/wallet_model.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/helpers/database_helper.dart';

abstract class WalletsLocalDataSource {
  Future<List<WalletModel>> loadWallets();
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
}

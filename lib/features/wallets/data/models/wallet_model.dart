import '../../domain/entities/wallet.dart';

class WalletModel extends Wallet {
  WalletModel(
    super.id, {
    required super.name,
    super.balance,
  });

  factory WalletModel.fromEntity(Wallet wallet) => WalletModel(
        wallet.id,
        name: wallet.name,
        balance: wallet.balance,
      );

  factory WalletModel.fromMap(Map<String, dynamic> object) => WalletModel(
        object["id"],
        name: object["name"],
        balance: object["balance"],
      );
}

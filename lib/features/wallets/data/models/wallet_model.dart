import '../../domain/entities/wallet.dart';

class WalletModel extends Wallet {
  WalletModel({
    super.id,
    required super.name,
    super.balance,
  });

  factory WalletModel.fromEntity(Wallet wallet) => WalletModel(
        id: wallet.id,
        name: wallet.name,
        balance: wallet.balance,
      );

  factory WalletModel.fromMap(Map<String, dynamic> json) => WalletModel(
        id: json["id"],
        name: json["name"],
        // don't forget to add balance in next time
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

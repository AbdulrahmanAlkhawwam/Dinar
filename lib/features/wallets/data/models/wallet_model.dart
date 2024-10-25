import '../../domain/entities/wallet.dart';

class WalletModel extends Wallet {
  WalletModel({
    super.id,
    required super.name,
    super.incomesTotal,
    super.paymentsTotal,
  });

  factory WalletModel.fromEntity(Wallet wallet) => WalletModel(
        id: wallet.id,
        name: wallet.name,
        incomesTotal: wallet.incomesTotal,
        paymentsTotal: wallet.paymentsTotal,
      );

  factory WalletModel.fromMap(Map<String, dynamic> json) => WalletModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}

import 'package:easy_localization/easy_localization.dart';

import '../../domain/entities/payment.dart';
import '../../../app/domain/entities/operation_type.dart';

class PaymentModel extends Payment {
  PaymentModel(
    super.id, {
    required super.name,
    required super.value,
    required super.description,
    required super.categoryId,
    required super.walletId,
    required super.date,
    required super.category,
    required super.wallet,
  });

  factory PaymentModel.fromEntity(Payment payment) => PaymentModel(
        payment.id,
        name: payment.name,
        value: payment.value,
        description: payment.description,
        categoryId: payment.categoryId,
        walletId: payment.walletId,
        date: payment.date,
        category: payment.category,
        wallet: payment.wallet,
      );

  factory PaymentModel.fromMap(Map<String, dynamic> object) => PaymentModel(
        object["id"],
        name: object["name"],
        value: object["value"],
        description: object["description"],
        categoryId: object["category_id"],
        walletId: object["wallet_id"],
        date: object["date"],
        category: object["category"],
        wallet: object["wallet"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "value": value,
        "description": description,
        "category_id": categoryId,
        "wallet_id": walletId,
        "date": DateFormat("yyyy-MM-dd a hh:mm '000Z'").format(date),
        "type": OperationType.income.toString()
      };
}
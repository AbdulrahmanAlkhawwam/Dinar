import 'package:easy_localization/easy_localization.dart';

import '../../../app/domain/entities/operation_type.dart';
import '../../domain/entities/operation.dart';

class OperationModel extends Operation {
  OperationModel({
    super.id,
    required super.name,
    required super.value,
    required super.description,
    required super.categoryId,
    required super.walletId,
    required super.category,
    required super.wallet,
    required super.date,
    required super.type,
  });

  factory OperationModel.fromEntity(Operation operation) => OperationModel(
        id: operation.id,
        name: operation.name,
        value: operation.value,
        description: operation.description,
        categoryId: operation.categoryId,
        walletId: operation.walletId,
        category: operation.category,
        wallet: operation.wallet,
        date: operation.date,
        type: operation.type,
      );

  factory OperationModel.fromMap(Map<String, dynamic> json) => OperationModel(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        description: json["description"],
        categoryId: json["category_id"],
        walletId: json["wallet_id"],
        category: json["category"],
        wallet: json["wallet"],
        type: json["type"] == "income"
            ? OperationType.income
            : OperationType.payment,
        date: DateFormat("yyyy-MM-dd a hh:mm '000Z'").parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "value": value,
        "description": description,
        "category_id": categoryId,
        "wallet_id": walletId,
        "date": DateFormat("yyyy-MM-dd a hh:mm '000Z'").format(date),
        "type": type.name
      };
}

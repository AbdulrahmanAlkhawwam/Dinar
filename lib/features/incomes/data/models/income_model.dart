import 'package:easy_localization/easy_localization.dart';

import '../../domain/entities/income.dart';
import '../../../app/domain/entities/operation_type.dart';

class IncomeModel extends Income {
  IncomeModel(
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

  factory IncomeModel.fromEntity(Income income) => IncomeModel(
        income.id,
        name: income.name,
        value: income.value,
        description: income.description,
        categoryId: income.categoryId,
        walletId: income.walletId,
        date: income.date,
        category: income.category,
        wallet: income.wallet,
      );

  factory IncomeModel.fromMap(Map<String, dynamic> object) => IncomeModel(
        object["id"],
        name: object["name"],
        value: double.parse(object["value"]),
        description: object["description"],
        categoryId: object["category_id"],
        walletId: object["wallet_id"],
        date: DateTime.parse(object["date"]),
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

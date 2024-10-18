import 'package:easy_localization/easy_localization.dart';

import '../../domain/entities/income.dart';

class IncomeModel extends Income {
  IncomeModel(
    super.id, {
    required super.name,
    required super.value,
    required super.description,
    required super.categoryId,
    required super.walletId,
    required super.category,
    required super.wallet,
    required super.date,
  });

  factory IncomeModel.fromEntity(Income income) => IncomeModel(
        income.id,
        name: income.name,
        value: income.value,
        description: income.description,
        categoryId: income.categoryId,
        walletId: income.walletId,
        category: income.category,
        wallet: income.wallet,
        date: income.date,
      );

  factory IncomeModel.fromMap(Map<String, dynamic> json) => IncomeModel(
        json["id"],
        name: json["name"],
        value: json["value"],
        description: json["description"],
        categoryId: json["category_id"],
        walletId: json["wallet_id"],
        category: json["category"],
        wallet: json["wallet"],
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

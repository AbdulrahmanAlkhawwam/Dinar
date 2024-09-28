import '../../../incomes/domain/entities/income.dart';

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
        value: object["value"],
        description: object["description"],
        categoryId: object["category_id"],
        walletId: object["wallet_id"],
        date: object["date"],
        category: object["category"],
        wallet: object["wallet"],
      );
}

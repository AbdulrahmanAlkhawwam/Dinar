import 'package:Dinar/features/app/domain/entities/operation_type.dart';
import 'package:Dinar/features/categories/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel(
    super.id, {
    required super.name,
    required super.type,
    required super.balance,
  });

  factory CategoryModel.fromEntity(Category category) => CategoryModel(
        category.id,
        name: category.name,
        type: category.type,
        balance: category.balance,
      );

  factory CategoryModel.fromMap(Map<String, dynamic> object) => CategoryModel(
        object["id"],
        name: object["name"],
        type: object["type"] == "income"
            ? OperationType.income
            : OperationType.payment,
        balance: object["balance"] ?? 0.0,
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "type": type.name,
      };
}

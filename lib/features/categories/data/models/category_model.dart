import 'package:Dinar/features/app/domain/entities/operation_type.dart';
import 'package:Dinar/features/categories/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    id,
    required super.name,
    required super.type,
    super.balance,
  });

  factory CategoryModel.fromEntity(Category category) => CategoryModel(
        id: category.id,
        name: category.name,
        type: category.type,
        balance: category.balance,
      );

  factory CategoryModel.fromMap(Map<String, dynamic> object) => CategoryModel(
        id: object["id"],
        name: object["name"],
        type: object["type"] == "income"
            ? OperationType.income
            : OperationType.payment,

        /// don't forget to add balance in next time
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "type": type.name,
      };
}

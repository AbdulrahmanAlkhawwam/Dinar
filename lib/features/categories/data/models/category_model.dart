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
        type: object["type"],
        balance: object["balance"],
      );
}

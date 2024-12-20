import '../../../app/domain/entities/operation_type.dart';
import '../../domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    super.id,
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

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        type: json["type"] == "income"
            ? OperationType.income
            : OperationType.payment,
      );

  Map<String, dynamic> toMap() => {"id": id, "name": name, "type": type.name};
}

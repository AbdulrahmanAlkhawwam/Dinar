import '../../../../core/constants/strings.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/helpers/database_helper.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../models/category_model.dart';

abstract class CategoriesLocalDataSource {
  Future<List<CategoryModel>> loadCategories(OperationType type);

  Future<int> addCategory(CategoryModel categoryModel);

  Future<void> deleteCategory(String id);
}

class CategoriesLocalDataSourceImpl extends CategoriesLocalDataSource {
  final DatabaseHelper db;

  CategoriesLocalDataSourceImpl({required this.db});

  @override
  Future<List<CategoryModel>> loadCategories(OperationType type) async {
    final categoriesMap =
        await db.getData(categoriesTable, where: "type = ?", args: [type.name]);
    final categories = categoriesMap
        .map((category) => CategoryModel.fromMap(category))
        .toList();
    return categories;
  }

  @override
  Future<int> addCategory(CategoryModel categoryModel) async =>
      await db.insert(categoriesTable, categoryModel.toMap());

  @override
  Future<void> deleteCategory(String id) async {
    final categoryOperation =
        await db.getData(operationsTable, where: "category_id = ?", args: [id]);
    if (categoryOperation.isEmpty) {
      await db.delete(categoriesTable, where: "id = ?", args: [id]);
    } else {
      throw DeleteException("you can't delete this category !");
    }
  }
}

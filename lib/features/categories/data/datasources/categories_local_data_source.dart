import '../../../../core/errors/exceptions.dart';
import '../models/category_model.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/helpers/database_helper.dart';

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
    final categoriesMap = await db.getData(
      categoriesTable,
      where: "type = ?",
      args: [type.name],
    );
    final categories = categoriesMap
        .map((category) => CategoryModel.fromMap(category))
        .toList();
    return categories;
  }

  @override
  Future<int> addCategory(CategoryModel categoryModel) async {
    final id = await db.insert(
      categoriesTable,
      categoryModel.toMap(),
    );
    return id;
  }

  @override
  Future<void> deleteCategory(String id) async {
    final categoryOperation =
        await db.getData(categoriesTable, where: "category_id = ?", args: [id]);
    if (categoryOperation.isNotEmpty) {
      await db.delete(
        categoriesTable,
        where: "id = ?",
        args: [id],
      );
    } else {
      throw DeleteException("you can't delete this category !");
    }
  }
}

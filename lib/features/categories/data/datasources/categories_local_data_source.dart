import 'package:Dinar/core/constants/strings.dart';
import 'package:Dinar/core/helpers/database_helper.dart';
import 'package:Dinar/features/app/domain/entities/operation_type.dart';
import '../models/category_model.dart';

abstract class CategoriesLocalDataSource {
  Future<List<CategoryModel>> loadCategories(OperationType type);
}

class CategoriesLocalDataSourceImpl extends CategoriesLocalDataSource {
  final DatabaseHelper db;

  CategoriesLocalDataSourceImpl({required this.db});

  @override
  Future<List<CategoryModel>> loadCategories(OperationType type) async {
    final categoriesMap = await db.getData(
      categoriesTable,
      where: "type = ?",
      args: [type.toString()],
    );
    final categories = categoriesMap
        .map((category) => CategoryModel.fromMap(category))
        .toList();

    return categories;
  }
}
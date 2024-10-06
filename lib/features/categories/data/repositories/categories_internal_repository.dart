import 'package:dartz/dartz.dart';

import '../datasources/categories_local_data_source.dart';
import '../../domain/repositories/categories_repository.dart';
import '../../domain/entities/category.dart';
import '../../../../core/errors/failures.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../models/category_model.dart';

class CategoriesInternalRepository extends CategoriesRepository {
  final CategoriesLocalDataSource localDataSource;

  CategoriesInternalRepository({required this.localDataSource});

  @override
  Future<Either<Failure, List<Category>>> loadCategories(
      OperationType type) async {
    try {
      final List<Category> categories =
          await localDataSource.loadCategories(type);
      return Right(categories);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addCategory(Category category) async {
    try {
      final id =
          await localDataSource.addCategory(CategoryModel.fromEntity(category));
      return Right(id);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}

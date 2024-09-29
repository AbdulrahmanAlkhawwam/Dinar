import 'package:dartz/dartz.dart';

import '../datasources/categories_local_data_source.dart';
import '../../domain/repositories/categories_repository.dart';
import '../../domain/entities/category.dart';
import '../../../../core/errors/failures.dart';
import '../../../app/domain/entities/operation_type.dart';

class CategoriesInternalRepository extends CategoriesRepository {
  final CategoriesLocalDataSource localDataSource;

  CategoriesInternalRepository({required this.localDataSource});

  @override
  Future<Either<Failure, List<Category>>> loadCategory(
      OperationType type) async {
    try {
      final List<Category> categories =
          await localDataSource.loadCategories(type);
      return (Right(categories));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
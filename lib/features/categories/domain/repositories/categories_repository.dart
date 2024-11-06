import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../entities/category.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<Category>>> loadCategories(OperationType type);

  Future<Either<Failure, int>> addCategory(Category category);

  Future<Either<Failure, void>> deleteCategory(String id);
}

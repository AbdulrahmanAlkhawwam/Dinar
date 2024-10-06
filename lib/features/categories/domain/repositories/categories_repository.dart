import 'package:dartz/dartz.dart';

import '../entities/category.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../../core/errors/failures.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<Category>>> loadCategories(OperationType type);

  Future<Either<Failure,int>> addCategory (Category category);
}

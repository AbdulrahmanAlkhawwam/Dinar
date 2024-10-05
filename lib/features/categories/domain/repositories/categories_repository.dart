import 'package:dartz/dartz.dart';

import '../../../app/domain/entities/operation_type.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../../core/errors/failures.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<Category>>> loadCategory(OperationType type);

  Future<Either<Failure,int>> addCategory (Category category);
}

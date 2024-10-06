import 'package:dartz/dartz.dart';

import '../entities/category.dart';
import '../repositories/categories_repository.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';

class LoadIncomeCategoriesUc extends UseCaseNoParam<List<Category>> {
  final CategoriesRepository repository;

  LoadIncomeCategoriesUc({required this.repository});

  @override
  Future<Either<Failure, List<Category>>> call() {
    return repository.loadCategories(OperationType.income);
  }
}

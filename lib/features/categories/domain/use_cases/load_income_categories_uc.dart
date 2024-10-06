import 'package:Dinar/features/app/domain/entities/operation_type.dart';
import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:Dinar/features/categories/domain/repositories/categories_repository.dart';
import 'package:dartz/dartz.dart';

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

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/category.dart';
import '../repositories/categories_repository.dart';

class AddCategoryUc extends UseCase<int, Category> {
  final CategoriesRepository repository;

  AddCategoryUc({required this.repository});

  @override
  Future<Either<Failure, int>> call({required Category param}) async =>
      await repository.addCategory(param);
}

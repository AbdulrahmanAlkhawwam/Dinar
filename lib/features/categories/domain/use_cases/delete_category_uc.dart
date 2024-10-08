import 'package:dartz/dartz.dart';

import '../repositories/categories_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';

class DeleteCategoryUc extends UseCase<void, String> {
  final CategoriesRepository repository;

  DeleteCategoryUc({required this.repository});

  @override
  Future<Either<Failure, void>> call({required String param}) async {
    return await repository.deleteCategory(param);
  }
}

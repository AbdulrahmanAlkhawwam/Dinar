import 'package:dartz/dartz.dart';

import '../entities/category.dart';
import '../repositories/categories_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../../core/errors/failures.dart';

class AddCategoryUc extends UseCase<int , Category>{
  final CategoriesRepository repository ;

  AddCategoryUc({required this.repository});

  @override
  Future<Either<Failure, int>> call({required Category param}) {
    return repository.addCategory(param);
  }

}
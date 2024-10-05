import 'package:Dinar/core/errors/failures.dart';
import 'package:Dinar/core/use_case/use_case.dart';
import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:Dinar/features/categories/domain/repositories/categories_repository.dart';
import 'package:dartz/dartz.dart';

class AddCategoryUc extends UseCase<int , Category>{
  final CategoriesRepository repository ;

  AddCategoryUc({required this.repository});

  @override
  Future<Either<Failure, int>> call({required Category param}) {
    return repository.addCategory(param);
  }

}
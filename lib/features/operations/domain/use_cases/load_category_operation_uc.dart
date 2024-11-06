import 'package:Dinar/core/errors/failures.dart';
import 'package:Dinar/core/use_case/use_case.dart';
import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:Dinar/features/operations/domain/entities/operation.dart';
import 'package:Dinar/features/operations/domain/repositories/operations_repository.dart';
import 'package:dartz/dartz.dart';

class LoadCategoryOperationUc extends UseCase<List<Operation>, Category> {
  final OperationsRepository repository;

  LoadCategoryOperationUc({required this.repository});

  @override
  Future<Either<Failure, List<Operation>>> call(
          {required Category param}) async =>
      await repository.loadOperations(category: param);
}

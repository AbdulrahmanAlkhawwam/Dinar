import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/operation_model.dart';
import '../entities/operation.dart';
import '../repositories/operations_repository.dart';

class AddOperationUc extends UseCase<int, OperationModel> {
  final OperationsRepository repository;

  AddOperationUc({required this.repository});

  @override
  Future<Either<Failure, int>> call({required Operation param}) async =>
      await repository.addOperation(param);
}

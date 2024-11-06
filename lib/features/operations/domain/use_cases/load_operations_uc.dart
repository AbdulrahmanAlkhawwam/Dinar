import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../entities/operation.dart';
import '../repositories/operations_repository.dart';

class LoadOperationsUc extends UseCaseNoParam<List<Operation>> {
  final OperationsRepository repository;

  LoadOperationsUc({required this.repository});

  @override
  Future<Either<Failure, List<Operation>>> call() async =>
      await repository.loadOperations();
}

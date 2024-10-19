import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../entities/operation.dart';
import '../repositories/operations_repository.dart';

class LoadPaymentOperationsUc extends UseCaseNoParam<List<Operation>> {
  final OperationsRepository repository;

  LoadPaymentOperationsUc({required this.repository});

  @override
  Future<Either<Failure, List<Operation>>> call() {
    return repository.loadOperations(OperationType.payment);
  }
}

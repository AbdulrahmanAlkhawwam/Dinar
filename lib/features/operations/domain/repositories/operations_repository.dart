import 'package:dartz/dartz.dart';

import '../../../app/domain/entities/operation_type.dart';
import '../../../operations/domain/entities/operation.dart';
import '../../../../core/errors/failures.dart';

abstract class OperationsRepository {
  Future<Either<Failure, List<Operation>>> loadOperations(OperationType type);

  Future<Either<Failure, int>> addOperation(Operation operation);
}

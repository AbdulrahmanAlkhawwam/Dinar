import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:dartz/dartz.dart';

import '../../../app/domain/entities/operation_type.dart';
import '../../../operations/domain/entities/operation.dart';
import '../../../../core/errors/failures.dart';
import '../../../wallets/domain/entities/wallet.dart';

abstract class OperationsRepository {
  Future<Either<Failure, List<Operation>>> loadOperations(
      {OperationType? type, Category? category, Wallet? wallet});

  Future<Either<Failure, int>> addOperation(Operation operation);

  Future<Either<Failure, void>> deleteOperation(String id);
}

import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:Dinar/features/wallets/domain/entities/wallet.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../app/domain/entities/operation_type.dart';
import '../../domain/entities/operation.dart';
import '../../domain/repositories/operations_repository.dart';
import '../data_sources/operations_local_data_source.dart';
import '../models/operation_model.dart';

class OperationsInternalRepository extends OperationsRepository {
  OperationsLocalDataSource localDataSource;

  OperationsInternalRepository({required this.localDataSource});

  @override
  Future<Either<Failure, int>> addOperation(Operation operation) async {
    try {
      final id = await localDataSource
          .addOperation(OperationModel.fromEntity(operation));
      return Right(id);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Operation>>> loadOperations(
      {OperationType? type, Category? category, Wallet? wallet}) async {
    try {
      final List<Operation> incomes =
          await localDataSource.loadOperations(type: type,wallet: wallet,category: category );

      return Right(incomes);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}

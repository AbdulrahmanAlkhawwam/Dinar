import 'package:Dinar/core/errors/failures.dart';
import 'package:Dinar/core/use_case/use_case.dart';
import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:Dinar/features/operations/domain/entities/operation.dart';
import 'package:Dinar/features/operations/domain/repositories/operations_repository.dart';
import 'package:Dinar/features/wallets/domain/entities/wallet.dart';
import 'package:dartz/dartz.dart';

class LoadWalletOperationUc extends UseCase<List<Operation>, Wallet> {
  final OperationsRepository repository;

  LoadWalletOperationUc({required this.repository});

  @override
  Future<Either<Failure, List<Operation>>> call({required Wallet param}) async {
    return await repository.loadOperations(wallet: param);
  }
}

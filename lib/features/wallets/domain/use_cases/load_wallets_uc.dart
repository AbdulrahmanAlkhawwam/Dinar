import 'package:dartz/dartz.dart';

import '../entities/wallet.dart';
import '../repositories/wallets_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';

class LoadWalletsUc extends UseCaseNoParam<List<Wallet>> {
  final WalletsRepository repository;

  LoadWalletsUc({required this.repository});

  @override
  Future<Either<Failure, List<Wallet>>> call() {
    return repository.loadWallet();
  }
}

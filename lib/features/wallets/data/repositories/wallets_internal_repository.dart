import 'package:dartz/dartz.dart';

import '../datasources/wallets_local_data_source.dart';
import '../../domain/repositories/wallets_repository.dart';
import '../../domain/entities/wallet.dart';
import '../../../../core/errors/failures.dart';

class WalletsInternalRepository extends WalletsRepository {
  final WalletsLocalDataSource localDataSource;

  WalletsInternalRepository({required this.localDataSource});

  @override
  Future<Either<Failure, List<Wallet>>> loadWallet() async {
    try {
      final List<Wallet> categories = await localDataSource.loadWallets();
      return (Right(categories));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}

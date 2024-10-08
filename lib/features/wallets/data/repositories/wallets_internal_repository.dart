import 'package:dartz/dartz.dart';

import '../models/wallet_model.dart';
import '../datasources/wallets_local_data_source.dart';
import '../../domain/repositories/wallets_repository.dart';
import '../../domain/entities/wallet.dart';
import '../../../../core/errors/failures.dart';

class WalletsInternalRepository extends WalletsRepository {
  final WalletsLocalDataSource localDataSource;

  WalletsInternalRepository({required this.localDataSource});

  @override
  Future<Either<Failure, List<Wallet>>> loadWallets() async {
    try {
      final List<Wallet> categories = await localDataSource.loadWallets();
      return (Right(categories));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addWallet(Wallet wallet) async {
    try {
      final int id =
          await localDataSource.addWallet(WalletModel.fromEntity(wallet));
      return Right(id);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteWallet(String id) async {
    try {
      await localDataSource.deleteWallet(id);
      return Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}

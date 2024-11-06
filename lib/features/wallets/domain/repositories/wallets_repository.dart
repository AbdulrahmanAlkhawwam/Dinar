import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../wallets/domain/entities/wallet.dart';

abstract class WalletsRepository {
  Future<Either<Failure, List<Wallet>>> loadWallets();

  Future<Either<Failure, int>> addWallet(Wallet wallet);

  Future<Either<Failure, void>> deleteWallet(String id);
}

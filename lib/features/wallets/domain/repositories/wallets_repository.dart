import 'package:dartz/dartz.dart';

import '../../../wallets/domain/entities/wallet.dart';
import '../../../../core/errors/failures.dart';

abstract class WalletsRepository {
  Future<Either<Failure, List<Wallet>>> loadWallets();

  Future<Either<Failure, int>> addWallet(Wallet wallet);
}

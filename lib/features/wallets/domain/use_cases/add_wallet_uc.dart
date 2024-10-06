import 'package:dartz/dartz.dart';

import '../entities/wallet.dart';
import '../repositories/wallets_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';

class AddWalletUc extends UseCase<int, Wallet> {
  final WalletsRepository repository;

  AddWalletUc({required this.repository});

  @override
  Future<Either<Failure, int>> call({required Wallet param}) {
    return repository.addWallet(param);
  }
}

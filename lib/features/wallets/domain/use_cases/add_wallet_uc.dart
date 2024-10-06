import 'package:Dinar/core/errors/failures.dart';
import 'package:Dinar/core/use_case/use_case.dart';
import 'package:Dinar/features/wallets/domain/entities/wallet.dart';
import 'package:Dinar/features/wallets/domain/repositories/wallets_repository.dart';
import 'package:dartz/dartz.dart';

class AddWalletUc extends UseCase<int, Wallet> {
  final WalletsRepository repository;

  AddWalletUc({required this.repository});

  @override
  Future<Either<Failure, int>> call({required Wallet param}) {
    return repository.addWallet(param);
  }
}

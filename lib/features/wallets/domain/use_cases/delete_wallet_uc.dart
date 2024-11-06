import 'package:dartz/dartz.dart';

import '../entities/wallet.dart';
import '../repositories/wallets_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';

class DeleteWalletUc extends UseCase<void, String> {
  final WalletsRepository repository;

  DeleteWalletUc({required this.repository});

  @override
  Future<Either<Failure, void>> call({required String param}) async =>
      await repository.deleteWallet(param);
}

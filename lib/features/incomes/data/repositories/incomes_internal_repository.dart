import 'package:dartz/dartz.dart';

import '../data_sources/incomes_local_data_source.dart';
import '../../domain/entities/income.dart';
import '../../domain/repositories/incomes_repository.dart';
import '../../../../core/errors/failures.dart';

class IncomesInternalRepositoryImp extends IncomesRepository {
  IncomesLocalDataSource localDataSource;

  IncomesInternalRepositoryImp({required this.localDataSource});

  @override
  Future<Either<Failure, List<Income>>> loadIncomes() async {
    try {
      final List<Income> incomes = await localDataSource.loadIncomes();
      return Right(incomes);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}

import 'package:dartz/dartz.dart';

import '../../../incomes/domain/entities/income.dart';
import '../../../incomes/domain/repositories/incomes_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';

class LoadIncomesUc extends UseCaseNoParam<List<Income>> {
  final IncomesRepository repository;

  LoadIncomesUc({required this.repository});

  @override
  Future<Either<Failure, List<Income>>> call() {
    return repository.loadIncomes();
  }
}

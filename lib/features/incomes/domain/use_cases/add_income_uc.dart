import 'package:Dinar/core/errors/failures.dart';
import 'package:Dinar/core/use_case/use_case.dart';
import 'package:Dinar/features/incomes/domain/entities/income.dart';
import 'package:Dinar/features/incomes/domain/repositories/incomes_repository.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/income_model.dart';

class AddIncomeUc extends UseCase<int, IncomeModel> {
  final IncomesRepository repository;

  AddIncomeUc({required this.repository});

  @override
  Future<Either<Failure, int>> call({required Income param}) {
    return repository.addIncome(param);
  }
}

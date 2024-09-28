import 'package:dartz/dartz.dart';

import '../../domain/entities/income.dart';
import '../../../../core/errors/failures.dart';

abstract class IncomesRepository {
  Future<Either<Failure, List<Income>>> loadIncomes();
}

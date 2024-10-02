import 'package:Dinar/features/payments/domain/entities/payment.dart';
import 'package:Dinar/features/payments/domain/repositories/payments_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../incomes/domain/entities/income.dart';
import '../../../incomes/domain/repositories/incomes_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/use_case/use_case.dart';

class LoadPaymentsUc extends UseCaseNoParam<List<Payment>> {
  final PaymentsRepository repository;

  LoadPaymentsUc({required this.repository});

  @override
  Future<Either<Failure, List<Payment>>> call() {
    return repository.loadPayments();
  }
}

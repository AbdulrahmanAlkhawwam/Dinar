import 'package:Dinar/core/errors/failures.dart';
import 'package:Dinar/core/use_case/use_case.dart';
import 'package:Dinar/features/incomes/domain/entities/income.dart';
import 'package:Dinar/features/incomes/domain/repositories/incomes_repository.dart';
import 'package:Dinar/features/payments/domain/entities/payment.dart';
import 'package:Dinar/features/payments/domain/repositories/payments_repository.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/payment_model.dart';

class AddPaymentUc extends UseCase<int, PaymentModel> {
  final PaymentsRepository repository;

  AddPaymentUc({required this.repository});

  @override
  Future<Either<Failure, int>> call({required Payment param}) {
    return repository.addPayment(param);
  }
}

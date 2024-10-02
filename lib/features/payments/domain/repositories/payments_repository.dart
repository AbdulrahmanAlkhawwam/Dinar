import 'package:dartz/dartz.dart';

import '../../domain/entities/payment.dart';
import '../../../../core/errors/failures.dart';

abstract class PaymentsRepository {
  Future<Either<Failure, List<Payment>>> loadPayments();

  Future<Either<Failure, int>> addPayment(Payment payment);
}

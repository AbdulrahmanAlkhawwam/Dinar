import 'package:dartz/dartz.dart';

import '../datasources/payments_local_data_source.dart';
import '../../domain/entities/payment.dart';
import '../../domain/repositories/payments_repository.dart';
import '../../../../core/errors/failures.dart';

class PaymentsInternalRepository extends PaymentsRepository {
  PaymentsLocalDataSource localDataSource;

  PaymentsInternalRepository({required this.localDataSource});

  @override
  Future<Either<Failure, List<Payment>>> loadPayments() async {
    try {
      final List<Payment> payments = await localDataSource.loadPayments();
      return Right(payments);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> addPayment(payment) async {
    try {
      final id = await localDataSource.addPayment(payment);
      return Right(id);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}

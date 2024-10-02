import 'package:Dinar/features/payments/data/datasources/payments_local_data_source.dart';
import 'package:Dinar/features/payments/data/repositories/payments_internal_repository.dart';
import 'package:Dinar/features/payments/domain/repositories/payments_repository.dart';
import 'package:Dinar/features/payments/domain/use_cases/add_payment_uc.dart';
import 'package:Dinar/features/payments/domain/use_cases/load_payments_uc.dart';
import 'package:Dinar/features/payments/presentation/manager/payment_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> initializePaymentServices(GetIt sl) async {
  sl.registerLazySingleton<PaymentsLocalDataSource>(
    () => PaymentsLocalDataSourceImpl(db: sl()),
  );

  sl.registerLazySingleton<PaymentsRepository>(
    () => PaymentsInternalRepository(localDataSource: sl()),
  );

  sl.registerLazySingleton<LoadPaymentsUc>(
    () => LoadPaymentsUc(repository: sl()),
  );

  sl.registerFactory<PaymentBloc>(
    () => PaymentBloc(
      loadPaymentsUc: LoadPaymentsUc(
        repository: sl(),
      ),
      addPaymentUc: AddPaymentUc(
        repository: sl(),
      ),
    ),
  );
}

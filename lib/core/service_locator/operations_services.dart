import 'package:get_it/get_it.dart';

import '../../features/operations/data/data_sources/operations_local_data_source.dart';
import '../../features/operations/data/repositories/operations_internal_repository.dart';
import '../../features/operations/domain/repositories/operations_repository.dart';
import '../../features/operations/domain/use_cases/add_operation_uc.dart';
import '../../features/operations/domain/use_cases/load_income_operations_uc.dart';
import '../../features/operations/domain/use_cases/load_payment_operations_uc.dart';
import '../../features/operations/presentation/manager/operation_bloc.dart';

Future<void> initializeOperationServices(GetIt sl) async {
  sl.registerLazySingleton<OperationsLocalDataSource>(
    () => OperationsLocalDataSourceImpl(db: sl()),
  );

  sl.registerLazySingleton<OperationsRepository>(
    () => OperationsInternalRepository(localDataSource: sl()),
  );

  sl.registerLazySingleton<LoadIncomeOperationsUc>(
    () => LoadIncomeOperationsUc(repository: sl()),
  );

  sl.registerLazySingleton<LoadPaymentOperationsUc>(
    () => LoadPaymentOperationsUc(repository: sl()),
  );

  sl.registerLazySingleton<AddOperationUc>(
    () => AddOperationUc(repository: sl()),
  );

  sl.registerFactory<OperationBloc>(
    () => OperationBloc(
      loadIncomesOperationUc: LoadIncomeOperationsUc(
        repository: sl(),
      ),
      loadPaymentOperationsUc: LoadPaymentOperationsUc(
        repository: sl(),
      ),
      addOperationUc: AddOperationUc(
        repository: sl(),
      ),
    ),
  );
}

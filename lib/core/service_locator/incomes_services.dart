import 'package:Dinar/features/incomes/data/data_sources/incomes_local_data_source.dart';
import 'package:Dinar/features/incomes/data/repositories/incomes_internal_repository.dart';
import 'package:Dinar/features/incomes/domain/repositories/incomes_repository.dart';
import 'package:Dinar/features/incomes/domain/use_cases/load_incomes_uc.dart';
import 'package:Dinar/features/incomes/presentation/manager/income_bloc.dart';
import 'package:get_it/get_it.dart';

Future<void> initializeIncomeServices(GetIt sl) async {
  sl.registerLazySingleton<IncomesLocalDataSource>(
      () => IncomesLocalDataSourceImpl(db: sl()));

  sl.registerLazySingleton<IncomesRepository>(
    () => IncomesInternalRepositoryImp(localDataSource: sl()),
  );
  sl.registerLazySingleton<LoadIncomesUc>(
    () => LoadIncomesUc(repository: sl()),
  );

  sl.registerFactory<IncomeBloc>(
    () => IncomeBloc(
      loadIncomesUc: sl(),
    ),
  );
}

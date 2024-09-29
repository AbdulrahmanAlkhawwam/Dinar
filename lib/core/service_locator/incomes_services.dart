import 'package:Dinar/features/incomes/domain/use_cases/add_income_uc.dart';
import 'package:get_it/get_it.dart';

import '../../features/incomes/data/data_sources/incomes_local_data_source.dart';
import '../../features/incomes/data/repositories/incomes_internal_repository.dart';
import '../../features/incomes/domain/repositories/incomes_repository.dart';
import '../../features/incomes/domain/use_cases/load_incomes_uc.dart';
import '../../features/incomes/presentation/manager/income_bloc.dart';

Future<void> initializeIncomeServices(GetIt sl) async {
  sl.registerLazySingleton<IncomesLocalDataSource>(
    () => IncomesLocalDataSourceImpl(db: sl()),
  );

  sl.registerLazySingleton<IncomesRepository>(
    () => IncomesInternalRepositoryImp(localDataSource: sl()),
  );

  sl.registerLazySingleton<LoadIncomesUc>(
    () => LoadIncomesUc(repository: sl()),
  );

  sl.registerFactory<IncomeBloc>(
    () => IncomeBloc(
      loadIncomesUc: LoadIncomesUc(
        repository: sl(),
      ),
      addIncomeUc: AddIncomeUc(
        repository: sl(),
      ),
    ),
  );
}

import 'package:get_it/get_it.dart';

import '../../features/wallets/data/datasources/wallets_local_data_source.dart';
import '../../features/wallets/data/repositories/wallets_internal_repository.dart';
import '../../features/wallets/domain/repositories/wallets_repository.dart';
import '../../features/wallets/domain/use_cases/load_wallets_uc.dart';
import '../../features/wallets/presentation/manager/wallets_bloc.dart';

Future<void> initializeWalletServices(GetIt sl) async {
  sl.registerLazySingleton<WalletsLocalDataSource>(
    () => WalletsLocalDataSourceImpl(db: sl()),
  );

  sl.registerLazySingleton<WalletsRepository>(
    () => WalletsInternalRepository(localDataSource: sl()),
  );

  sl.registerLazySingleton<LoadWalletsUc>(
    () => LoadWalletsUc(repository: sl()),
  );

  sl.registerFactory<WalletsBloc>(
    () => WalletsBloc(
      loadWallets: LoadWalletsUc(
        repository: sl(),
      ),
    ),
  );
}

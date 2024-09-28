// import 'package:get_it/get_it.dart';
// import 'package:saleem/src/features/periods/domain/use_cases/update_period_uc.dart';
//
// import '../../features/periods/data/data_sources/periods_local_data_source.dart';
// import '../../features/periods/data/data_sources/periods_remote_data_source.dart';
// import '../../features/periods/data/repositories/periods_cloud_repository.dart';
// import '../../features/periods/data/repositories/periods_repository_impl.dart';
// import '../../features/periods/domain/repositories/periods_repository.dart';
// import '../../features/periods/domain/use_cases/add_period_uc.dart';
// import '../../features/periods/domain/use_cases/delete_period_uc.dart';
// import '../../features/periods/domain/use_cases/edit_morning_notification_uc.dart';
// import '../../features/periods/domain/use_cases/load_periods_uc.dart';
// import '../../features/periods/presentation/manager/edit_period_cubit.dart';
// import '../../features/periods/presentation/manager/period_bloc.dart';
//
// Future<void> initializePeriodsServices(GetIt sl, bool isRemote) async {
//   sl.registerLazySingleton<PeriodsLocalDataSource>(
//     () => PeriodsLocalDataSourceImpl(db: sl(), storage: sl()),
//   );
//   sl.registerLazySingleton<PeriodsRemoteDataSource>(
//     () => PeriodsRemoteDataSourceImpl(http: sl()),
//   );
//
//   sl.registerLazySingleton<PeriodsRepository>(
//     () => isRemote
//         ? PeriodsCloudRepository(
//             remoteDataSource: sl(),
//             localDataSource: sl(),
//             notifications: sl(),
//             analytics: sl(),
//           )
//         : PeriodsInternalRepository(
//             localDataSource: sl(),
//             notifications: sl(),
//             analytics: sl(),
//           ),
//   );
//
//   sl.registerLazySingleton(() => LoadPeriodsUC(repository: sl()));
//   sl.registerLazySingleton(() => UpdatePeriodUC(repository: sl()));
//   sl.registerLazySingleton(() => AddPeriodUC(repository: sl()));
//   sl.registerLazySingleton(() => DeletePeriodUC(repository: sl()));
//   sl.registerLazySingleton(() => EditMorningNotificationUC(repository: sl()));
//
//   sl.registerFactory(
//     () => PeriodBloc(
//       addPeriodUC: sl(),
//       updatePeriodUC: sl(),
//       loadPeriodsUC: sl(),
//       deletePeriodUC: sl(),
//       editMorningNotificationUC: sl(),
//     ),
//   );
//   sl.registerFactory(() => EditPeriodCubit());
// }

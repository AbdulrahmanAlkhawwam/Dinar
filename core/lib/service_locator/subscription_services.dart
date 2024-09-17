// import 'package:get_it/get_it.dart';
//
// import '../../features/subscription/data/data_sources/subscription_local_data_source.dart';
// import '../../features/subscription/data/data_sources/subscription_remote_data_source.dart';
// import '../../features/subscription/data/repositories/subscription_repository_impl.dart';
// import '../../features/subscription/domain/repositories/subscription_repository.dart';
// import '../../features/subscription/domain/use_cases/get_available_plans_uc.dart';
// import '../../features/subscription/domain/use_cases/get_subscription_status_uc.dart';
// import '../../features/subscription/domain/use_cases/open_mail_for_expiration_uc.dart';
// import '../../features/subscription/domain/use_cases/open_store_subscription_settings_uc.dart';
// import '../../features/subscription/domain/use_cases/purchase_subscription_uc.dart';
// import '../../features/subscription/domain/use_cases/request_free_subscription_uc.dart';
// import '../../features/subscription/domain/use_cases/restore_subscription_uc.dart';
// import '../../features/subscription/domain/use_cases/set_allowed_habits_after_expiration_uc.dart';
// import '../../features/subscription/presentation/manager/edit_subscription_cubit.dart';
// import '../../features/subscription/presentation/manager/subscription_bloc.dart';
//
// Future<void> initializeSubscriptionServices(GetIt sl, bool isRemote) async {
//   sl.registerLazySingleton<SubscriptionRemoteDataSource>(
//     () => SubscriptionRemoteDataSourceImpl(),
//   );
//
//   sl.registerLazySingleton<SubscriptionLocalDataSource>(
//     () => SubscriptionLocalDataSourceImpl(storage: sl()),
//   );
//
//   sl.registerLazySingleton<SubscriptionRepository>(
//     () => SubscriptionRepositoryImpl(
//       remoteDataSource: sl(),
//       localDataSource: sl(),
//       url: sl(),
//       analytics: sl(),
//     ),
//   );
//
//   sl.registerLazySingleton(() => GetSubscriptionStatusUC(repository: sl()));
//   sl.registerLazySingleton(() => GetAvailablePlansUC(repository: sl()));
//   sl.registerLazySingleton(() => PurchaseSubscriptionUC(repository: sl()));
//   sl.registerLazySingleton(() => RestoreSubscriptionUC(repository: sl()));
//   sl.registerLazySingleton(() => SetAllowedHabitsAfterExpirationUC(repository: sl()));
//   sl.registerLazySingleton(() => RequestFreeSubscriptionUC(repository: sl()));
//   sl.registerLazySingleton(() => OpenStoreSubscriptionSettingsUC(repository: sl()));
//   sl.registerLazySingleton(() => OpenMailForExpirationUC(repository: sl()));
//
//   sl.registerFactory(
//     () => SubscriptionBloc(
//       getSubscriptionStatusUC: sl(),
//       getAvailablePlansUC: sl(),
//       purchaseSubscriptionUC: sl(),
//       restoreSubscriptionUC: sl(),
//       setAllowedHabitsAfterExpirationUC: sl(),
//       requestFreeSubscriptionUC: sl(),
//       openStoreSubscriptionSettingsUC: sl(),
//       openMailForExpirationUC: sl(),
//     ),
//   );
//   sl.registerFactory(() => EditSubscriptionCubit());
// }

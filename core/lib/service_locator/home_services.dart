// import 'package:get_it/get_it.dart';
//
// import '../../features/home/data/data_sources/home_local_data_source.dart';
// import '../../features/home/data/repositories/home_repository_impl.dart';
// import '../../features/home/domain/repositories/home_repository.dart';
// import '../../features/home/domain/use_cases/initialize_notifications_uc.dart';
// import '../../features/home/domain/use_cases/open_ejad_website_uc.dart';
// import '../../features/home/domain/use_cases/open_saleem_mail_uc.dart';
// import '../../features/home/domain/use_cases/open_saleem_website_uc.dart';
// import '../../features/home/domain/use_cases/play_goal_sound_uc.dart';
// import '../../features/home/presentation/manager/home_bloc.dart';
// import '../../features/home/presentation/manager/scrolling_notifier.dart';
//
// Future<void> initializeHomeServices(GetIt sl) async {
//   sl.registerLazySingleton<HomeLocalDataSource>(
//     () => HomeLocalDataSourceImpl(storage: sl()),
//   );
//
//   sl.registerLazySingleton<HomeRepository>(
//     () => HomeRepositoryImpl(
//       localDataSource: sl(),
//       notifications: sl(),
//       soundPlayer: sl(),
//       url: sl(),
//       analytics: sl(),
//     ),
//   );
//
//   sl.registerLazySingleton(() => InitializeNotificationsUC(repository: sl()));
//   sl.registerLazySingleton(() => PlayGoalSoundUC(repository: sl()));
//   sl.registerLazySingleton(() => OpenEjadWebsiteUC(repository: sl()));
//   sl.registerLazySingleton(() => OpenSaleemWebsiteUC(repository: sl()));
//   sl.registerLazySingleton(() => OpenSaleemMailUC(repository: sl()));
//
//   sl.registerFactory(
//     () => HomeBloc(
//       initializeNotificationsUC: sl(),
//       playGoalSoundUC: sl(),
//       openEjadWebsiteUC: sl(),
//       openSaleemWebsiteUC: sl(),
//       openSaleemMailUC: sl(),
//     ),
//   );
//   sl.registerFactory(() => ScrollingNotifier());
// }

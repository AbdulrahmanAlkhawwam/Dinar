// import 'package:get_it/get_it.dart';
//
// import '../../features/habits/data/data_sources/habits_local_data_source.dart';
// import '../../features/habits/data/data_sources/habits_remote_data_source.dart';
// import '../../features/habits/data/repositories/habits_cloud_repository.dart';
// import '../../features/habits/data/repositories/habits_internal_repository.dart';
// import '../../features/habits/domain/repositories/habits_repository.dart';
// import '../../features/habits/domain/use_cases/add_habit_completion_uc.dart';
// import '../../features/habits/domain/use_cases/add_habit_uc.dart';
// import '../../features/habits/domain/use_cases/delete_habit_completion_uc.dart';
// import '../../features/habits/domain/use_cases/delete_habit_uc.dart';
// import '../../features/habits/domain/use_cases/get_list_filter_uc.dart';
// import '../../features/habits/domain/use_cases/is_new_wizard_completed_uc.dart';
// import '../../features/habits/domain/use_cases/load_habits_uc.dart';
// import '../../features/habits/domain/use_cases/load_habit_uc.dart';
// import '../../features/habits/domain/use_cases/set_first_habit_wizard_completed_uc.dart';
// import '../../features/habits/domain/use_cases/set_list_filter_uc.dart';
// import '../../features/habits/domain/use_cases/updat_habit_uc.dart';
// import '../../features/habits/presentation/manager/bloc/habit_bloc.dart';
// import '../../features/habits/presentation/manager/cubits/edit_cubit.dart';
// import '../../features/habits/presentation/manager/cubits/tile_cubit.dart';
// import '../../features/habits/presentation/manager/cubits/treasure_cubit.dart';
// import '../../features/habits/presentation/manager/cubits/view_cubit.dart';
//
// Future<void> initializeHabitsServices(GetIt sl, bool isRemote) async {
//   sl.registerLazySingleton<HabitsLocalDataSource>(
//     () => HabitsLocalDataSourceImpl(db: sl(), storage: sl()),
//   );
//
//   sl.registerLazySingleton<HabitsRemoteDataSource>(
//     () => HabitsRemoteDataSourceImpl(http: sl()),
//   );
//
//   sl.registerLazySingleton<HabitsRepository>(
//     () => isRemote
//         ? HabitsCloudRepository(
//             localDataSource: sl(),
//             remoteDataSource: sl(),
//             notifications: sl(),
//             player: sl(),
//             analytics: sl(),
//           )
//         : HabitsInternalRepository(
//             localDataSource: sl(),
//             notifications: sl(),
//             player: sl(),
//             analytics: sl(),
//           ),
//   );
//
//   sl.registerLazySingleton(() => LoadHabitsUC(repository: sl()));
//   sl.registerLazySingleton(() => AddHabitUC(repository: sl()));
//   sl.registerLazySingleton(() => LoadHabitUC(repository: sl()));
//   sl.registerLazySingleton(() => UpdateHabitUC(repository: sl()));
//   sl.registerLazySingleton(() => AddHabitCompletionUC(repository: sl()));
//   sl.registerLazySingleton(() => DeleteHabitCompletionUC(repository: sl()));
//   sl.registerLazySingleton(() => DeleteHabitUC(repository: sl()));
//   sl.registerLazySingleton(() => GetListModeUC(repository: sl()));
//   sl.registerLazySingleton(() => SetListModeUC(repository: sl()));
//   sl.registerLazySingleton(() => IsFirstHabitWizardCompletedUC(repository: sl()));
//   sl.registerLazySingleton(() => SetFirstHabitWizardCompletedUC(repository: sl()));
//
//   sl.registerFactory(
//     () => HabitBloc(
//       loadHabitsUC: sl(),
//       addHabitUC: sl(),
//       updateHabitUC: sl(),
//       addHabitCompletionUC: sl(),
//       deleteHabitCompletionUC: sl(),
//       deleteHabitUC: sl(),
//       getListModeUC: sl(),
//       setListModeUC: sl(),
//       isFirstHabitWizardCompletedUC: sl(),
//       setFirstHabitWizardCompletedUC: sl(),
//     ),
//   );
//   sl.registerFactory(() => TileCubit());
//   sl.registerFactory(() => EditCubit());
//   sl.registerFactory(() => ViewCubit(
//         loadHabitUC: sl(),
//       ));
//   sl.registerFactory(() => TreasureCubit());
// }

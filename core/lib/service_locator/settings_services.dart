// import 'package:get_it/get_it.dart';
//
// import '../../features/settings/data/data_sources/settings_remote_data_source.dart';
// import '../../features/settings/data/repositories/settings_repository_impl.dart';
// import '../../features/settings/domain/repositories/settings_repository.dart';
// import '../../features/settings/domain/use_cases/done_sound_uc.dart';
// import '../../features/settings/domain/use_cases/first_week_day_uc.dart';
// import '../../features/settings/domain/use_cases/goal_sound_uc.dart';
// import '../../features/settings/domain/use_cases/habits_time_enabled_uc.dart';
// import '../../features/settings/domain/use_cases/periods_end_enabled_uc.dart';
// import '../../features/settings/domain/use_cases/periods_start_enabled_uc.dart';
// import '../../features/settings/domain/use_cases/snooze_length_uc.dart';
// import '../../features/settings/domain/use_cases/theme_uc.dart';
// import '../../features/settings/presentation/manager/notifications_notifier.dart';
// import '../../features/settings/presentation/manager/sounds_notifier.dart';
// import '../../features/settings/presentation/manager/theme_notifier.dart';
// import '../../features/settings/presentation/manager/week_days_notifier.dart';
//
// Future<void> initializeSettingsServices(GetIt sl) async {
//   sl.registerLazySingleton<SettingsLocalDataSource>(
//     () => SettingsLocalDataSourceImpl(storage: sl()),
//   );
//
//   sl.registerLazySingleton<SettingsRepository>(
//     () => SettingsRepositoryImpl(localDataSource: sl(), notifications: sl(), analytics: sl()),
//   );
//
//   sl.registerLazySingleton(() => GetSnoozeLengthUC(repository: sl()));
//   sl.registerLazySingleton(() => SetSnoozeLengthUC(repository: sl()));
//   sl.registerLazySingleton(() => GetHabitsTimeEnabledUC(repository: sl()));
//   sl.registerLazySingleton(() => SetHabitsTimeEnabledUC(repository: sl()));
//   sl.registerLazySingleton(() => GetPeriodsStartEnabledUC(repository: sl()));
//   sl.registerLazySingleton(() => SetPeriodsStartEnabledUC(repository: sl()));
//   sl.registerLazySingleton(() => GetPeriodsEndEnabledUC(repository: sl()));
//   sl.registerLazySingleton(() => SetPeriodsEndEnabledUC(repository: sl()));
//   sl.registerLazySingleton(() => GetDoneSoundUC(repository: sl()));
//   sl.registerLazySingleton(() => SetDoneSoundUC(repository: sl()));
//   sl.registerLazySingleton(() => GetGoalSoundUC(repository: sl()));
//   sl.registerLazySingleton(() => SetGoalSoundUC(repository: sl()));
//   sl.registerLazySingleton(() => GetThemeUC(repository: sl()));
//   sl.registerLazySingleton(() => SetThemeUC(repository: sl()));
//   sl.registerLazySingleton(() => GetFirstWeekDayUC(repository: sl()));
//   sl.registerLazySingleton(() => SetFirstWeekDayUC(repository: sl()));
//
//   sl.registerFactory(
//     () => NotificationsNotifier(
//       getSnoozeLengthUC: sl(),
//       setSnoozeLengthUC: sl(),
//       getHabitsTimeEnabledUC: sl(),
//       setHabitsTimeEnabledUC: sl(),
//       getPeriodsStartEnabledUC: sl(),
//       setPeriodsStartEnabledUC: sl(),
//       getPeriodsEndEnabledUC: sl(),
//       setPeriodsEndEnabledUC: sl(),
//     ),
//   );
//
//   sl.registerFactory(
//     () => SoundsNotifier(
//       getDoneSoundUC: sl(),
//       setDoneSoundUC: sl(),
//       getGoalSoundUC: sl(),
//       setGoalSoundUC: sl(),
//     ),
//   );
//
//   sl.registerFactory(
//     () => ThemeNotifier(
//       getThemeUC: sl(),
//       setThemeUC: sl(),
//     ),
//   );
//
//   sl.registerFactory(
//     () => WeekDaysNotifier(
//       getFirstWeekDayUC: sl(),
//       setFirstWeekDayUC: sl(),
//     ),
//   );
// }

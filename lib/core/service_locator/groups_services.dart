// import 'package:get_it/get_it.dart';
//
// import '../../features/groups/data/data_sources/groups_remote_data_source.dart';
// import '../../features/groups/data/repositories/groups_repository_impl.dart';
// import '../../features/groups/domain/repositories/groups_repository.dart';
// import '../../features/groups/domain/use_cases/get_group_uc.dart';
// import '../../features/groups/domain/use_cases/join_group_uc.dart';
// import '../../features/groups/domain/use_cases/leave_group_uc.dart';
// import '../../features/groups/domain/use_cases/load_groups_uc.dart';
// import '../../features/groups/presentation/manager/group_cubit.dart';
// import '../../features/groups/presentation/manager/groups_bloc.dart';
//
// Future<void> initializeGroupsServices(GetIt sl) async {
//   sl.registerLazySingleton<GroupsRemoteDataSource>(
//     () => GroupsRemoteDataSourceImpl(http: sl()),
//   );
//
//   sl.registerLazySingleton<GroupsRepository>(
//     () => GroupsRepositoryImpl(
//       remoteDataSource: sl(),
//     ),
//   );
//
//   sl.registerLazySingleton(() => LoadGroupsUC(repository: sl()));
//   sl.registerLazySingleton(() => GetGroupUC(repository: sl()));
//   sl.registerLazySingleton(() => LeaveGroupUC(repository: sl()));
//   sl.registerLazySingleton(() => JoinGroupUC(repository: sl()));
//
//   sl.registerFactory(() => GroupsBloc(
//         loadGroupsUC: sl(),
//         leaveGroupUC: sl(),
//       ));
//   sl.registerFactory(() => GroupCubit(
//         joinGroupUC: sl(),
//         getGroupUC: sl(),
//       ));
// }

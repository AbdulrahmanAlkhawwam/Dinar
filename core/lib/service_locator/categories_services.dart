// import 'package:get_it/get_it.dart';
// import 'package:saleem/src/features/categories/domain/use_cases/add_category_uc.dart';
// import 'package:saleem/src/features/categories/domain/use_cases/update_category_uc.dart';
// import 'package:saleem/src/features/categories/presentation/manager/edit_category_cubit.dart';
//
// import '../../features/categories/data/data_sources/categories_local_data_source.dart';
// import '../../features/categories/data/data_sources/categories_remote_data_source.dart';
// import '../../features/categories/data/repositories/categories_cloud_repository.dart';
// import '../../features/categories/data/repositories/categories_internal_repository.dart';
// import '../../features/categories/domain/repositories/categories_repository.dart';
// import '../../features/categories/domain/use_cases/delete_category_uc.dart';
// import '../../features/categories/domain/use_cases/load_categories_uc.dart';
// import '../../features/categories/presentation/manager/category_bloc.dart';
//
// Future<void> initializeCategoriesServices(GetIt sl, bool isRemote) async {
//   sl.registerLazySingleton<CategoriesLocalDataSource>(
//     () => CategoriesLocalDataSourceImpl(db: sl()),
//   );
//   sl.registerLazySingleton<CategoriesRemoteDataSource>(
//     () => CategoriesRemoteDataSourceImpl(http: sl()),
//   );
//
//   sl.registerLazySingleton<CategoriesRepository>(
//     () => isRemote
//         ? CategoriesCloudRepository(remoteDataSource: sl(), analytics: sl())
//         : CategoriesInternalRepository(localDataSource: sl(), analytics: sl()),
//   );
//
//   sl.registerLazySingleton(() => LoadCategoriesUC(repository: sl()));
//   sl.registerLazySingleton(() => AddCategoryUC(repository: sl()));
//   sl.registerLazySingleton(() => UpdateCategoryUC(repository: sl()));
//   sl.registerLazySingleton(() => DeleteCategoryUC(repository: sl()));
//
//   sl.registerFactory(
//     () => CategoryBloc(
//       addCategoryUC: sl(),
//       updateCategoryUC: sl(),
//       loadCategoriesUC: sl(),
//       deleteCategoryUC: sl(),
//     ),
//   );
//   sl.registerFactory(() => EditCategoryCubit());
// }

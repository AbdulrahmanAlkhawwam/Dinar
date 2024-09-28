// import 'package:get_it/get_it.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import '../../features/auth/data/data_sources/auth_local_data_source.dart';
// import '../../features/auth/data/data_sources/auth_remote_data_source.dart';
// import '../../features/auth/data/repositories/auth_repository_impl.dart';
// import '../../features/auth/domain/repositories/auth_repositories.dart';
// import '../../features/auth/domain/use_cases/change_password_uc.dart';
// import '../../features/auth/domain/use_cases/check_user_credentials_uc.dart';
// import '../../features/auth/domain/use_cases/confirm_email_uc.dart';
// import '../../features/auth/domain/use_cases/delete_sessions_uc.dart';
// import '../../features/auth/domain/use_cases/delete_user_uc.dart';
// import '../../features/auth/domain/use_cases/edit_user_uc.dart';
// import '../../features/auth/domain/use_cases/forget_password_uc.dart';
// import '../../features/auth/domain/use_cases/get_sessions_uc.dart';
// import '../../features/auth/domain/use_cases/login_uc.dart';
// import '../../features/auth/domain/use_cases/login_with_apple_uc.dart';
// import '../../features/auth/domain/use_cases/login_with_google_uc.dart';
// import '../../features/auth/domain/use_cases/logout_uc.dart';
// import '../../features/auth/domain/use_cases/resend_email_uc.dart';
// import '../../features/auth/domain/use_cases/reset_password_uc.dart';
// import '../../features/auth/domain/use_cases/signup_uc.dart';
// import '../../features/auth/presentation/manager/auth_bloc.dart';
// import '../constants/env.dart';
//
// Future<void> initializeAuthServices(GetIt sl) async {
//   sl.registerLazySingleton<AuthLocalDataSource>(
//     () => AuthLocalDataSourceImpl(storage: sl(), database: sl()),
//   );
//
//   sl.registerLazySingleton<AuthRemoteDataSource>(
//     () => AuthRemoteDataSourceImpl(
//       http: sl(),
//       googleSignIn: sl(),
//     ),
//   );
//
//   sl.registerLazySingleton<AuthRepository>(
//     () => AuthRepositoryImpl(
//       remoteDataSource: sl(),
//       localDataSource: sl(),
//       analytics: sl(),
//       notifications: sl(),
//     ),
//   );
//
//   sl.registerLazySingleton(() => CheckUserCredentialsUC(repository: sl()));
//   sl.registerLazySingleton(() => LoginUC(repository: sl()));
//   sl.registerLazySingleton(() => SignupUC(repository: sl()));
//   sl.registerLazySingleton(() => LogoutUC(repository: sl()));
//   sl.registerLazySingleton(() => EditUserUC(repository: sl()));
//   sl.registerLazySingleton(() => ChangePasswordUC(repository: sl()));
//   sl.registerLazySingleton(() => ResendEmailUC(repository: sl()));
//   sl.registerLazySingleton(() => ConfirmEmailUC(repository: sl()));
//   sl.registerLazySingleton(() => ForgetPasswordUC(repository: sl()));
//   sl.registerLazySingleton(() => ResetPasswordUC(repository: sl()));
//   sl.registerLazySingleton(() => GetSessionsUC(repository: sl()));
//   sl.registerLazySingleton(() => DeleteSessionsUC(repository: sl()));
//   sl.registerLazySingleton(() => DeleteUserUC(repository: sl()));
//   sl.registerLazySingleton(() => LoginWithGoogleUC(repository: sl()));
//   sl.registerLazySingleton(() => LoginWithAppleUC(repository: sl()));
//
//   sl.registerFactory(
//     () => AuthBloc(
//       checkUserCredentialsUC: sl(),
//       loginUC: sl(),
//       signupUC: sl(),
//       logoutUC: sl(),
//       editUserUC: sl(),
//       resendEmailUC: sl(),
//       confirmEmailUC: sl(),
//       changePasswordUC: sl(),
//       forgetPasswordUC: sl(),
//       resetPasswordUC: sl(),
//       getSessionsUC: sl(),
//       deleteSessionsUC: sl(),
//       loginWithGoogleUC: sl(),
//       loginWithAppleUC: sl(),
//       deleteUserUC: sl(),
//     ),
//   );
//
//   sl.registerLazySingleton(
//     () => GoogleSignIn(
//       serverClientId: Env.googleServerClientId,
//     ),
//   );
// }

// import 'package:get_it/get_it.dart';
//
// import '../constants/strings.dart';
// import '../helpers/storage_helper.dart';
// import './auth_services.dart';
// import './categories_services.dart';
// import './core_services.dart';
// import './habits_services.dart';
// import './home_services.dart';
// import './periods_services.dart';
// import './settings_services.dart';
// import './subscription_services.dart';
// import 'groups_services.dart';
//
// final sl = GetIt.instance;
// bool isRemote = false;
//
// Future<void> initializeApp({bool firstInit = true}) async {
//   await initializeCoreServices(sl, firstInit: firstInit);
//   await initializeAuthServices(sl);
//   await initializeHomeServices(sl);
//   await initializeSettingsServices(sl);
//
//   isRemote = !sl<StorageHelper>().contains(firstTimeOpenKey) ||
//       sl<StorageHelper>().contains(deviceRegisteredKey);
//
//   await initializeHabitsServices(sl, isRemote);
//   await initializePeriodsServices(sl, isRemote);
//   await initializeCategoriesServices(sl, isRemote);
//   await initializeSubscriptionServices(sl, isRemote);
//   await initializeGroupsServices(sl);
// }
//
// Future<void> reinitializeApp() async {
//   await sl.reset();
//   await initializeApp(firstInit: false);
// }

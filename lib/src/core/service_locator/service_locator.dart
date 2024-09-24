// import 'package:get_it/get_it.dart';

// import '../constants/strings.dart';
// import '../helpers/storage_helper.dart';
import 'package:get_it/get_it.dart';

import './categories_services.dart';
import './histories_services.dart';
import './app_services.dart';
import './onboardings_services.dart';
import './incomes_services.dart';
import './payments_services.dart';
import './wallets_services.dart';
import './home_services.dart';

final sl = GetIt.instance;

Future<void> initializeApp({bool firstInit = true}) async {
  await initializeAppServices(sl);
  await initializeCategoryServices(sl);
  await initializeHistoryServices(sl);
  await initializeHomeServices(sl);
  await initializeIncomeServices(sl);
  await initializeOnboardingServices(sl);
  await initializePaymentServices(sl);
  await initializeWalletServices(sl);
}

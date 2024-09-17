// import 'dart:io';
//
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get_it/get_it.dart';
// import 'package:http/http.dart' as http;
// import 'package:mixpanel_flutter/mixpanel_flutter.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../constants/env.dart';
// import '../constants/firebase_options.dart';
// import '../constants/strings.dart';
// import '../helpers/analytics_helper.dart';
// import '../helpers/audio_player.dart';
// import '../helpers/database_helper.dart';
// import '../helpers/http_helper.dart';
// import '../helpers/notifications_helper.dart';
// import '../helpers/storage_helper.dart';
// import '../helpers/url_helper.dart';
// import '../utils/app_links_handler.dart';
//
// Future<void> initializeCoreServices(GetIt sl, {required bool firstInit}) async {
//   if (firstInit) {
//     WidgetsFlutterBinding.ensureInitialized();
//
//     if (Platform.isAndroid) {
//       SecurityContext.defaultContext
//           .setTrustedCertificatesBytes(Uint8List.fromList(isrgRootX1.codeUnits));
//     }
//
//     SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         systemNavigationBarColor: Colors.transparent,
//       ),
//     );
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//
//     await EasyLocalization.ensureInitialized();
//
//     await Purchases.configure(PurchasesConfiguration(Env.revenuecatLegacyApiKey));
//
//     await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//     FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
//
//     final mixpanel = await Mixpanel.init(Env.mixpanelToken, trackAutomaticEvents: true);
//     sl.registerLazySingleton<AnalyticsHelper>(() => AnalyticsHelperImpl(mixpanel: mixpanel));
//
//     final notifications = await NotificationsHelperImpl.instance();
//     sl.registerLazySingleton<NotificationsHelper>(() => notifications);
//   } else {
//     final mixpanel = Mixpanel(Env.mixpanelToken);
//     sl.registerLazySingleton<AnalyticsHelper>(() => AnalyticsHelperImpl(mixpanel: mixpanel));
//
//     final notifications = NotificationsHelperImpl.initializedInstance;
//     sl.registerLazySingleton<NotificationsHelper>(() => notifications);
//   }
//
//   final db = await DatabaseHelperImpl.instance();
//   sl.registerLazySingleton<DatabaseHelper>(
//     () => db,
//     dispose: (db) => db.close(),
//   );
//
//   sl.registerLazySingleton<UrlHelper>(() => UrlHelperImpl());
//
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => preferences);
//   sl.registerLazySingleton<StorageHelper>(() => StorageHelperImpl(sl()));
//
//   sl.registerLazySingleton(() => AssetsAudioPlayer());
//   sl.registerLazySingleton<AudioPlayer>(
//     () => AudioPlayerImpl(sl()),
//     dispose: (audioPlayer) => audioPlayer.dispose(),
//   );
//
//   sl.registerLazySingleton<HttpHelper>(
//     () => HttpHelperImpl(
//       host: Env.host,
//       basePath: "/api/v1",
//       client: http.Client(),
//       storage: sl(),
//     ),
//     dispose: (httpHelper) => httpHelper.close(),
//   );
//
//   final appLinksHandler = AppLinksHandler(
//     checkAuth: () => sl<StorageHelper>().contains(accessTokenKey),
//   );
//   await appLinksHandler.checkInitialUri();
//   sl.registerSingleton(appLinksHandler);
// }

// import 'dart:async';
//
// import 'package:app_links/app_links.dart';
// import 'package:flutter/material.dart';
//
// import '../../features/auth/presentation/manager/auth_bloc.dart';
// import '../constants/routes.dart';
// import '../service_locator/service_locator.dart';
//
// class AppLinksHandler {
//   final AppLinks _appLinks;
//   final bool Function() checkAuth;
//
//   AppLinksHandler({required this.checkAuth}) : _appLinks = AppLinks();
//
//   StreamSubscription<Uri>? _linksSubscription;
//
//   Future<void> checkInitialUri() async {
//     void setInitialRoute(
//       String path, {
//       Map<String, dynamic>? arguments,
//       bool auth = false,
//     }) {
//       if (auth && !checkAuth()) {
//         path = Routes.login;
//         arguments = null;
//       }
//
//       sl.registerSingleton<String>(path, instanceName: Routes.initialRouteKey);
//       if (arguments != null) {
//         sl.registerSingleton<Map>(arguments, instanceName: Routes.initialArgsKey);
//       }
//     }
//
//     try {
//       final uri = await _appLinks.getInitialLink();
//       _determineRedirect(
//         uri,
//         onHome: () => setInitialRoute(Routes.home),
//         onLogin: (email) => setInitialRoute(
//           Routes.login,
//           arguments: {"email": email},
//         ),
//         onConfirmEmail: (token) => setInitialRoute(
//           Routes.confirmEmail,
//           arguments: {"type": ConfirmType.signup, "token": token},
//         ),
//         onResetPassword: (token) => setInitialRoute(
//           Routes.resetPassword,
//           arguments: {"token": token},
//         ),
//         onSettings: () => setInitialRoute(Routes.settings),
//         onProfile: () => setInitialRoute(Routes.profile, auth: true),
//         onSubscription: () => setInitialRoute(
//           Routes.subscription,
//           auth: true,
//         ),
//         onManageSubscription: () {},
//         onJoinGroup: (uuid) => setInitialRoute(
//           Routes.joinGroup,
//           arguments: {"uuid": uuid},
//           auth: true,
//         ),
//         other: (path) => setInitialRoute(Routes.splash),
//       );
//     } catch (e) {
//       setInitialRoute(Routes.splash);
//     }
//   }
//
//   void listen(navigatorKey) {
//     _linksSubscription = _appLinks.uriLinkStream.listen((uri) {
//       final navigator = navigatorKey.currentState as NavigatorState?;
//
//       _determineRedirect(
//         uri,
//         onHome: () => navigator?.pushNamedAndRemoveUntil(
//           Routes.home,
//           (route) => false,
//         ),
//         onLogin: (email) {
//           if (!checkAuth()) {
//             navigator?.pushNamedAndRemoveUntil(
//               Routes.login,
//               arguments: {"email": email},
//               (route) => false,
//             );
//           } else {
//             navigator?.pushNamed(Routes.login);
//           }
//         },
//         onConfirmEmail: (token) => navigator?.pushNamedAndRemoveUntil(
//           Routes.confirmEmail,
//           (route) => route.isFirst,
//           arguments: {"type": ConfirmType.signup, "token": token},
//         ),
//         onResetPassword: (token) => navigator?.pushNamedAndRemoveUntil(
//           Routes.resetPassword,
//           (route) => route.isFirst,
//           arguments: {"token": token},
//         ),
//         onSettings: () => navigator?.pushNamed(Routes.settings),
//         onProfile: () {
//           if (checkAuth()) {
//             return navigator?.pushNamed(
//               Routes.profile,
//             );
//           } else {
//             navigator?.pushNamed(Routes.login);
//           }
//         },
//         onSubscription: () => navigator?.pushNamed(Routes.subscription),
//         onManageSubscription: () {},
//         onJoinGroup: (uuid) {
//           if (checkAuth()) {
//             navigator?.pushNamed(
//               Routes.joinGroup,
//               arguments: {"uuid": uuid},
//             );
//           } else {
//             navigator?.pushNamed(Routes.login);
//           }
//         },
//       );
//     });
//   }
//
//   void cancel() {
//     _linksSubscription?.cancel();
//   }
//
//   void _determineRedirect(
//     Uri? uri, {
//     required Function() onHome,
//     required Function(String? email) onLogin,
//     required Function(String token) onConfirmEmail,
//     required Function(String token) onResetPassword,
//     required Function() onSettings,
//     required Function() onProfile,
//     required Function() onSubscription,
//     required Function() onManageSubscription,
//     required Function(String uuid) onJoinGroup,
//     Function(String? path)? other,
//   }) {
//     if (uri == null) return other?.call(null);
//     final path = uri.pathSegments.where((e) => e.isNotEmpty).toList();
//     switch (path) {
//       case [] || ["home"]:
//         return onHome();
//       case ["auth", "login"] || ["auth", "register"]:
//         final email = uri.queryParameters["email"];
//         return onLogin(email);
//       case ["auth", "confirm-email"]:
//         final token = uri.queryParameters["verify_token"];
//         if (token == null) break;
//         return onConfirmEmail(token);
//       case ["auth", "password-recovery"]:
//         final token = uri.queryParameters["verify_token"];
//         if (token == null) break;
//         return onResetPassword(token);
//
//       case ["my-account"]:
//         return onSettings();
//       case ["my-account", "profile"] || ["my-account", "profile", "edit"]:
//         return onProfile();
//       case ["my-account", "children"]:
//       case ["my-account", "subscription"]:
//         return onSubscription();
//       case ["my-account", "subscription", "manage"]:
//         return onManageSubscription();
//       case ["invite", String uuid]:
//         return onJoinGroup(uuid);
//     }
//
//     return other?.call(uri.path);
//   }
// }

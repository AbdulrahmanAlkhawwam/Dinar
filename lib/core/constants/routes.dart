// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:flutter/material.dart';
//
// import '../../features/auth/presentation/manager/auth_bloc.dart';
// import '../../features/auth/presentation/screens/confirm_email_screen.dart';
// import '../../features/auth/presentation/screens/forgot_password_screen.dart';
// import '../../features/auth/presentation/screens/login_screen.dart';
// import '../../features/auth/presentation/screens/profile_screen.dart';
// import '../../features/auth/presentation/screens/register_screen.dart';
// import '../../features/auth/presentation/screens/reset_password_screen.dart';
// import '../../features/categories/presentation/pages/categories_settings_page.dart';
// import '../../features/common/first_habit_wizard/first_habit_wizard_screen.dart';
// import '../../features/common/on_boarding/on_boarding_screen.dart';
// import '../../features/common/splash_screen/splash_screen.dart';
// import '../../features/groups/presentation/pages/groups_page.dart';
// import '../../features/groups/presentation/pages/join_group_page.dart';
// import '../../features/habits/presentation/pages/habit_edit_page.dart';
// import '../../features/habits/presentation/pages/habit_page.dart';
// import '../../features/habits/presentation/pages/habits_library_page.dart';
// import '../../features/habits/presentation/pages/user_habits_page.dart';
// import '../../features/home/presentation/pages/home_page.dart';
// import '../../features/periods/presentation/pages/periods_settings_page.dart';
// import '../../features/settings/presentation/pages/about_app_page.dart';
// import '../../features/settings/presentation/pages/settings_page.dart';
// import '../../features/subscription/presentation/pages/subscribed_page.dart';
// import '../../features/subscription/presentation/pages/subscription_expired_page.dart';
// import '../../features/subscription/presentation/pages/subscription_page.dart';
// import '../service_locator/service_locator.dart';
//
// class Routes {
//   Routes._();
//
//   static const String splash = "/splash";
//   static const String home = "/home";
//   static const String onBoarding = "/on-boarding";
//   static const String habits = "/habits";
//   static const String habitPage = "/habits/view";
//   static const String habitEdit = "/habits/edit";
//   static const String habitsLibrary = "/habits/library";
//   static const String firstHabitWizard = "/habits/first-wizard";
//   static const String settings = "/settings";
//   static const String periodsSettings = "/settings/periods";
//   static const String categoriesSettings = "/settings/categories";
//   static const String about = "/about";
//   static const String subscription = "/subscription";
//   static const String subscriptionExpired = "/subscription/expired";
//   static const String subscribed = "/subscription/subscribed";
//   static const String login = "/auth";
//   static const String register = "/auth/register";
//   static const String forgotPassword = "/auth/forgot-password";
//   static const String confirmEmail = "/auth/confirm-email";
//   static const String resetPassword = "/auth/reset-password";
//   static const String profile = "/settings/profile";
//   static const String groups = "/groups";
//   static const String joinGroup = "/groups/join";
//
//   static const String initialRouteKey = "initial_route";
//   static const String initialArgsKey = "initial_route_args";
//
//   static String get initialRoute => sl<String>(instanceName: initialRouteKey);
//
//   static Map? get _initialArgs {
//     if (!sl.isRegistered<Map>(instanceName: initialArgsKey)) {
//       return null;
//     }
//     final args = sl<Map>(instanceName: initialArgsKey);
//     sl.unregister<Map>(instanceName: initialArgsKey);
//     return args;
//   }
//
//   static final routes = {
//     home: (context, arguments) => HomePage(),
//     splash: (context, arguments) => SplashScreen(),
//     onBoarding: (context, arguments) => OnBoardingScreen(),
//     habits: (context, arguments) => UserHabitsPage(),
//     habitPage: (context, arguments) => HabitPage(),
//     habitEdit: (context, arguments) => HabitEditPage(),
//     habitsLibrary: (context, arguments) => HabitsLibraryPage(),
//     firstHabitWizard: (context, arguments) => FirstHabitWizardScreen(),
//     settings: (context, arguments) => SettingsPage(),
//     periodsSettings: (context, arguments) => PeriodsSettingsPage(),
//     categoriesSettings: (context, arguments) => CategoriesSettingsPage(),
//     about: (context, arguments) => AboutAppPage(),
//     subscription: (context, arguments) => SubscriptionPage(),
//     subscriptionExpired: (context, arguments) => SubscriptionExpiredPage(),
//     subscribed: (context, arguments) => SubscribedPage(),
//     login: (context, arguments) => LoginScreen(),
//     register: (context, arguments) => RegisterScreen(),
//     forgotPassword: (context, arguments) {
//       final email = arguments?["email"] as String?;
//       return ForgotPasswordScreen(initialEmail: email);
//     },
//     confirmEmail: (context, arguments) {
//       final initialArgs = _initialArgs;
//       final token, type;
//       if (initialArgs != null) {
//         type = initialArgs["type"];
//         token = initialArgs["token"];
//       } else {
//         type = arguments?["type"] as ConfirmType;
//         token = arguments?["token"] as String?;
//       }
//       final email = arguments?["email"] as String?;
//
//       return ConfirmEmailScreen(type, token: token, email: email);
//     },
//     resetPassword: (context, arguments) {
//       final initialArgs = _initialArgs;
//       String? token = initialArgs != null ? initialArgs["token"] : arguments?["token"];
//       if (token == null) {
//         return LoginScreen();
//       }
//
//       return ResetPasswordScreen(token);
//     },
//     profile: (context, arguments) => ProfileScreen(),
//     groups: (context, arguments) => GroupsPage(),
//     joinGroup: (context, arguments) {
//       final initialArgs = _initialArgs;
//       String uuid = initialArgs != null ? initialArgs["uuid"] : arguments?["uuid"];
//       return JoinGroupPage(uuid: uuid);
//     },
//   };
//
//   static Route? onGenerateRoute(RouteSettings settings) {
//     FirebaseAnalytics.instance.logScreenView(screenName: settings.name);
//     if (settings.name == "/") {
//       return null;
//     }
//     // if (settings.name == home || settings.name == onBoarding) {
//     //   return PageRouteBuilder(
//     //     pageBuilder: (context, __, ___) => routes[settings.name]!(context, settings.arguments),
//     //     transitionDuration: const Duration(milliseconds: 500),
//     //     settings: settings,
//     //     transitionsBuilder: (context, animation, __, child) {
//     //       return FadeTransition(opacity: animation, child: child);
//     //     },
//     //   );
//     // }
//     if (!routes.containsKey(settings.name)) {
//       return _onUnknownRoute(settings);
//     }
//     return MaterialPageRoute(
//       builder: (context) => routes[settings.name]!(context, settings.arguments),
//       settings: settings,
//     );
//   }
//
//   static Route? _onUnknownRoute(settings) {
//     return MaterialPageRoute(
//       builder: (_) => Scaffold(
//         body: Center(
//           child: Text("No route defined for ${settings.name}"),
//         ),
//       ),
//     );
//   }
// }

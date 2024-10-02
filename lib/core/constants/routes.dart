import 'package:Dinar/features/categories/presentation/manager/categories_bloc.dart';
import 'package:Dinar/features/categories/presentation/pages/categories_screen.dart';
import 'package:Dinar/features/onboarding/presentation/pages/creation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/wallets/presentation/manager/wallets_bloc.dart';
import '../service_locator/service_locator.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/history/presentation/pages/history_screen.dart';
import '../../features/incomes/presentation/pages/incomes_screen.dart';
import '../../features/payments/presentation/pages/payments_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';

class Routes {
  Routes._();

  static const String home = "/home";
  static const String checker = "/home/checker";
  static const String onBoarding = "/on-boarding";
  static const String categories = "/categories";
  static const String categoriesAdd = "/categories/Add";
  static const String wallets = "/wallets";
  static const String walletsAdd = "/wallets/Add";
  static const String incomes = "/incomes";
  static const String payments = "/payments";
  static const String history = "/history";

  static const String splash = "/splash";
  static const String habits = "/habits";
  static const String habitPage = "/habits/view";
  static const String habitEdit = "/habits/edit";
  static const String habitsLibrary = "/habits/library";
  static const String firstHabitWizard = "/habits/first-wizard";
  static const String settings = "/settings";
  static const String periodsSettings = "/settings/periods";
  static const String categoriesSettings = "/settings/categories";
  static const String about = "/about";
  static const String subscription = "/subscription";
  static const String subscriptionExpired = "/subscription/expired";
  static const String subscribed = "/subscription/subscribed";
  static const String login = "/auth";
  static const String register = "/auth/register";
  static const String forgotPassword = "/auth/forgot-password";
  static const String confirmEmail = "/auth/confirm-email";
  static const String resetPassword = "/auth/reset-password";
  static const String profile = "/settings/profile";
  static const String groups = "/groups";
  static const String joinGroup = "/groups/join";

  static const String initialRouteKey = "initial_route";
  static const String initialArgsKey = "initial_route_args";

  static final routes = {
    home: (context, arguments) => HomeScreen(),
    onBoarding: (context, arguments) => OnboardingScreen(),
    categories: (context, arguments) => CategoriesScreen(),
    incomes: (context, arguments) => IncomesScreen(),
    payments: (context, arguments) => PaymentsScreen(),
    history: (context, arguments) => HistoryScreen(),
    categoriesAdd: (context, arguments) => CreationScreen(),
    walletsAdd: (context, arguments) => CreationScreen(),
  };

  static Route onGenerateRoute(setting) {
    return MaterialPageRoute(
      builder: (context) {
        final payCategories = context.read<CategoriesBloc>().paymentCategories;
        final incCategories = context.read<CategoriesBloc>().incomeCategories;
        final userWallets = context.read<WalletsBloc>().wallets;
        if (payCategories.isEmpty &&
            incCategories.isEmpty &&
            userWallets.isEmpty) {
          return routes[onBoarding]!(context, null);
        } else if (payCategories.isEmpty && incCategories.isEmpty) {
          return routes[categoriesAdd]!(context, null);
        } else if (userWallets.isEmpty) {
          return routes[walletsAdd]!(context, null);
        } else {
          return routes[home]!(context, null);
        }
      },
    );
  }
}

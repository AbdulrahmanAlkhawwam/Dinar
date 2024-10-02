import 'package:Dinar/features/categories/presentation/manager/categories_bloc.dart';
import 'package:Dinar/features/incomes/presentation/manager/income_bloc.dart';
import 'package:Dinar/features/incomes/presentation/pages/add_income_screen.dart';
import 'package:Dinar/features/incomes/presentation/pages/incomes_screen.dart';
import 'package:Dinar/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:Dinar/features/payments/presentation/manager/payment_bloc.dart';
import 'package:Dinar/features/payments/presentation/pages/payments_screen.dart';
import 'package:Dinar/features/wallets/presentation/manager/wallets_bloc.dart';
import 'package:Dinar/features/wallets/presentation/pages/wallets_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './core/constants/theme.dart';
import './features/app/presentation/pages/management_screen.dart';
import './features/app/presentation/manager/general/general_bloc.dart';
import 'core/constants/routes.dart';
import 'core/service_locator/service_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    print("we are in main screen");
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl.get<IncomeBloc>()..add(IncomeInitEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => sl.get<PaymentBloc>()..add(PaymentInitEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => sl.get<CategoriesBloc>()..add(CategoryInitEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => sl.get<WalletsBloc>()..add(WalletInitEvent()),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: PaymentsScreen(),
        // initialRoute: Routes.onBoarding,
        // onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}

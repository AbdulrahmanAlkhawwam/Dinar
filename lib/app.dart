import 'package:Dinar/core/constants/colors.dart';
import 'package:Dinar/features/categories/presentation/manager/categories_bloc.dart';
import 'package:Dinar/features/categories/presentation/pages/categories_screen.dart';
import 'package:Dinar/features/incomes/presentation/manager/income_bloc.dart';
import 'package:Dinar/features/payments/presentation/manager/payment_bloc.dart';
import 'package:Dinar/features/wallets/presentation/manager/wallets_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import './core/constants/theme.dart';
import './features/app/presentation/pages/management_screen.dart';
import 'core/service_locator/service_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IncomeBloc>(
          create: (_) => sl.get<IncomeBloc>()..add(IncomeInitEvent()),
          lazy: false,
        ),
        BlocProvider<PaymentBloc>(
          create: (_) => sl.get<PaymentBloc>()..add(PaymentInitEvent()),
          lazy: false,
        ),
        BlocProvider<CategoriesBloc>(
          create: (_) => sl.get<CategoriesBloc>()..add(CategoryInitEvent()),
          lazy: false,
        ),
        BlocProvider<WalletsBloc>(
          create: (_) => sl.get<WalletsBloc>()..add(WalletInitEvent()),
          lazy: false,
        ),
      ],
      child: GlobalLoaderOverlay(
        overlayColor: Colors.black45,
        overlayWidgetBuilder: (_) => Center(
          child: LinearProgressIndicator(
            minHeight: double.infinity,
            valueColor: AlwaysStoppedAnimation(
              lightColorScheme.primary.withOpacity(0.5),
            ),
            backgroundColor: Colors.transparent,
          ),
        ),
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: Builder(
            builder: (context) {
              return ManagementScreen();
            },
          ),
        ),
      ),
    );
  }
}

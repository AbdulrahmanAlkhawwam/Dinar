import 'package:Dinar/features/incomes/presentation/manager/income_bloc.dart';
import 'package:Dinar/features/incomes/presentation/pages/add_income_screen.dart';
import 'package:Dinar/features/incomes/presentation/pages/incomes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './core/constants/theme.dart';
import './features/app/presentation/pages/management_screen.dart';
import './features/app/presentation/manager/general/general_bloc.dart';
import 'core/service_locator/service_locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    print("we are in main screen");
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => GeneralBloc()),
        BlocProvider(
            create: (_) => sl.get<IncomeBloc>()..add(IncomeInitEvent())),
        // BlocProvider(
        //     create: (_) => sl.get<IncomeBloc>()..add(IncomeInitEvent())),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home:
            AddIncomeScreen(), /* BlocBuilder<GeneralBloc, GeneralState>(
          builder: (context, state) {
            return const ManagementScreen();
          },
        ),*/
      ),
    );
  }
}

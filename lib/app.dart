import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'core/constants/theme.dart';
import 'core/service_locator/service_locator.dart';
import 'features/app/presentation/pages/management_screen.dart';
import 'features/categories/presentation/manager/categories_bloc.dart';
import 'features/operations/presentation/manager/operation_bloc.dart';
import 'features/wallets/presentation/manager/bloc/wallets_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OperationBloc>(
          create: (_) => sl.get<OperationBloc>()..add(LoadOperationsEvent()),
          lazy: false,
        ),
        BlocProvider<CategoriesBloc>(
          create: (_) => sl.get<CategoriesBloc>()..add(LoadCategoriesEvent()),
          lazy: false,
        ),
        BlocProvider<WalletsBloc>(
          create: (_) => sl.get<WalletsBloc>()..add(LoadWalletsEvent()),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: Builder(builder: (context) => ManagementScreen()),
      ),
    );
  }
}

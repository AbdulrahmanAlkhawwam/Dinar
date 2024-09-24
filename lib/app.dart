import 'package:Dinar/src/core/components/buttons/primary_button.dart';
import 'package:Dinar/src/core/service_locator/service_locator.dart';
import 'package:Dinar/src/core/styles/colors/light_colors.dart';
import 'package:Dinar/src/core/styles/themes/light_theme.dart';
import 'package:Dinar/src/core/utils/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../src/features/app/presentation/pages/management_screen.dart';
import '../src/features/app/presentation/manager/general/general_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    print("we are in main screen");
    return MultiBlocProvider(
      providers: [
        BlocProvider<GeneralBloc>(
          create: (context) => GeneralBloc(),
        ),
      ],
      child: MaterialApp(
        // theme: AppTheme,
        home: BlocBuilder<GeneralBloc, GeneralState>(
          builder: (context, state) {
            return const ManagementScreen();
          },
        ),
      ),
    );
  }
}

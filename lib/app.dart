import 'package:Dinar/home/presentation/pages/home_screen.dart';
import 'package:Dinar/home/presentation/pages/management_screen.dart';
import 'package:core/components/loading.dart';
import 'package:core/styles/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/presentation/manager/general/general_bloc.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(context) {
    // return MultiBlocProvider(
    //     providers: [
    //       BlocProvider(
    //         create: (context) => GeneralBloc(),
    //       )
    //     ],
    //     child: MaterialApp(
    //       home: BlocBuilder(
    //         builder: (context, state) => const HomeScreen(),
    //       ),
    //     ));
    print("we are in main screen");
    return BlocProvider<GeneralBloc>(
      create: (context) => GeneralBloc()
        ..add(
          InitialisationEvent(),
        ),
      child: MaterialApp(
        theme: lightTheme,
        home: BlocBuilder<GeneralBloc, GeneralState>(
          builder: (context, state) {
            return HomeScreen();
            if (state is LoadedState) {
              return const ManagementScreen();
            }
            return const Loading();
          },
        ),
      ),
    );
  }
}

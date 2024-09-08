import 'package:Dinar/manager/general/general_bloc.dart';
import 'package:Dinar/screens/management_screen.dart';
import 'package:core/components/static_components/loading.dart';
import 'package:core/styles/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    print ("we are in main screen");
    return BlocProvider<GeneralBloc>(
      create: (context) => GeneralBloc()
        ..add(
          InitialisationEvent(),
        ),
      child: MaterialApp(
        theme: lightTheme,
        home: BlocBuilder<GeneralBloc, GeneralState>(
          builder: (context, state) {
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

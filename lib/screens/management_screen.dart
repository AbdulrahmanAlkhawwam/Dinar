import 'package:Dinar/screens/creation_screen.dart';
import 'package:core/components/static_components/loading.dart';
import 'package:core/components/static_components/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/general/general_bloc.dart';
import '../models/kind.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("we are in management screen");
    context.read<GeneralBloc>().add(CheckEvent());
    return BlocBuilder<GeneralBloc, GeneralState>(
      builder: (context, state) {
        print('2+2+2+2+ :$state');
        switch (state) {
          case LoadingState _:
            return const Loading();
          case LoadedState _:
            switch (context.read<GeneralBloc>().kind) {
              case Kind.twice:
                return const OnboardingScreen();
              case Kind.non:
                return const HomeScreen();
              default:
                return const CreationScreen();
            }
          case ErrorState _:
            return Screen(
              child: Scaffold(
                body: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error,
                        size: 75,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        textAlign: TextAlign.center,
                        "there are some error \n reopen your app \n ${state.message}",
                      )
                    ],
                  ),
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

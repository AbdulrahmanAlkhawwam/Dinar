import 'package:Dinar/features/onboarding/presentation/pages/creation_screen.dart';

import '../../../categories/presentation/manager/categories_bloc.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../onboarding/presentation/pages/onboarding_screen.dart';

import '../../../wallets/presentation/manager/wallets_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final payCategories = context.read<CategoriesBloc>().paymentCategories;
    final incCategories = context.read<CategoriesBloc>().incomeCategories;
    final userWallets = context.read<WalletsBloc>().wallets;

    if (payCategories.isEmpty && incCategories.isEmpty && userWallets.isEmpty) {
      return OnboardingScreen();
    } else if (payCategories.isEmpty && incCategories.isEmpty) {
      return CreationScreen(title: "Category");
    } else if (userWallets.isEmpty) {
      return CreationScreen(title: "Wallet");
    } else {
      return HomeScreen();
    }
  }
}

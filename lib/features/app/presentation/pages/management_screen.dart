import 'package:Dinar/core/constants/strings.dart';
import 'package:Dinar/features/categories/domain/entities/category.dart';
import 'package:Dinar/features/onboarding/presentation/pages/creation_screen.dart';
import 'package:Dinar/features/wallets/domain/entities/wallet.dart';

import '../../../categories/presentation/manager/categories_bloc.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../../../onboarding/presentation/pages/onboarding_screen.dart';

import '../../../wallets/presentation/manager/bloc/wallets_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({super.key});

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  bool _categoriesLoaded = false;
  bool _walletsLoaded = false;

  @override
  Widget build(BuildContext context) {
    List<Category> payCategories =
        context.read<CategoriesBloc>().paymentCategories;
    List<Category> incCategories =
        context.read<CategoriesBloc>().incomeCategories;
    List<Wallet> userWallets = context.read<WalletsBloc>().wallets;

    return MultiBlocListener(
      listeners: [
        BlocListener<CategoriesBloc, CategoriesState>(
          listener: (context, state) {
            if (state is CategoriesLoaded) {
              payCategories = context.read<CategoriesBloc>().paymentCategories;
              incCategories = context.read<CategoriesBloc>().incomeCategories;
              setState(() => _categoriesLoaded = true);
            }
          },
        ),
        BlocListener<WalletsBloc, WalletsState>(
          listener: (context, state) {
            if (state is WalletsLoaded) {
              userWallets = context.read<WalletsBloc>().wallets;
              setState(() => _walletsLoaded = true);
            }
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          if (_categoriesLoaded && _walletsLoaded) {
            if (payCategories.isEmpty &&
                incCategories.isEmpty &&
                userWallets.isEmpty) {
              return OnboardingScreen();
            } else if (payCategories.isEmpty && incCategories.isEmpty) {
              return CreationScreen(title: texts["app"]["cat_type"]);
            } else if (userWallets.isEmpty) {
              return CreationScreen(title: texts["app"]['wal_type']);
            } else {
              return HomeScreen();
            }
          } else {
            return Scaffold();
          }
        },
      ),
    );
  }
}

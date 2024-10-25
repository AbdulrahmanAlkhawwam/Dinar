import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/wallets/presentation/manager/wallets_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletsBloc, WalletsState>(
      builder: (context, state) {
        if (state is WalletsLoaded) {
          return Container(
            height: (state.wallets[0].incomesTotal! >
                    state.wallets[0].paymentsTotal!)
                ? 160
                : 140,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: context.gradient.fixedSecondaryColor,
              border: Border.all(
                color: context.colors.secondary,
                width: 2,
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 14, 24, 18),
                child: switch (state) {
                  WalletsLoaded _ => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(state.wallets[0].name,
                              style: context.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w900,
                              )),
                        ),
                        const Spacer(),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Incomes : ",
                                style: context.textTheme.titleSmall
                                    ?.copyWith(height: 0),
                              ),
                              TextSpan(
                                text: "${state.wallets[0].incomesTotal ?? 0}",
                                style: context.textTheme.labelMedium
                                    ?.copyWith(height: 0),
                              ),
                              TextSpan(
                                text: "\npayments : ",
                                style: context.textTheme.titleSmall
                                    ?.copyWith(fontSize: 16, height: 0),
                              ),
                              TextSpan(
                                text: "${state.wallets[0].paymentsTotal ?? 0}",
                                style: context.textTheme.labelSmall
                                    ?.copyWith(height: 0),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        (state.wallets[0].incomesTotal! >
                                state.wallets[0].paymentsTotal!)
                            ? Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      color: context.colors.onTertiaryContainer,
                                      backgroundColor: context.colors.primary,
                                      minHeight: 16,
                                      borderRadius: BorderRadius.circular(20),
                                      value: (state.wallets[0].incomesTotal! /
                                          state.wallets[0].paymentsTotal!),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                      "${(state.wallets[0].incomesTotal! / state.wallets[0].paymentsTotal!).floor()} %"),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  WalletsLoading _ =>
                    Center(child: CircularProgressIndicator()),
                  _ => const SizedBox(),
                }),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

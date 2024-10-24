import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/wallets/presentation/manager/wallets_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletsBloc, WalletsState>(
      builder: (context, state) {
        return Container(
          height: 160,
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
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Balance : ",
                              style: context.textTheme.titleSmall
                                  ?.copyWith(height: 0),
                            ),
                            TextSpan(
                              text: "${state.wallets[0].balance ?? 0}",
                              style: context.textTheme.labelMedium
                                  ?.copyWith(height: 0),
                            ),
                            TextSpan(
                              text: "\nyour usage : ",
                              style: context.textTheme.titleSmall
                                  ?.copyWith(fontSize: 16, height: 0),
                            ),
                            TextSpan(
                              text: "${state.wallets[0].balance ?? 0}",
                              style: context.textTheme.labelSmall
                                  ?.copyWith(height: 0),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: LinearProgressIndicator(
                              color: context.colors.onTertiaryContainer,
                              backgroundColor: context.colors.primary,
                              minHeight: 16,
                              borderRadius: BorderRadius.circular(20),
                              value: 0.45,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text("45%"),
                        ],
                      )
                    ],
                  ),
                WalletsLoading _ => Center(child: CircularProgressIndicator()),
                _ => const SizedBox(),
              }),
        );
      },
    );
  }
}

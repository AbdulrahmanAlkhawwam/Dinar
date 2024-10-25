import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/widgets/items_list.dart';
import '../../../wallets/presentation/manager/wallets_bloc.dart';
import '../../../wallets/presentation/pages/wallets_screen.dart';

class WalletList extends StatelessWidget {
  const WalletList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletsBloc, WalletsState>(
      builder: (context, state) {
        if (state is WalletsInitial ||
            state is WalletsError ||
            state is WalletsLoaded && state.wallets.isEmpty) {
          return const SizedBox();
        } else {
          if (state is WalletsLoaded) {
            return ItemsList(
              list: state.wallets,
              type: "wallet",
              // title: "Wallets",
              route: MaterialPageRoute(
                builder: (context) => WalletsScreen(),
              ),
            );
          }
          return const SizedBox();
          // return Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     const SizedBox(height: 10),
          //     Row(
          //       children: [
          //         Text(
          //           "Wallets",
          //           style: context.textTheme.titleSmall,
          //         ),
          //         const Spacer(),
          //         TextButton(
          //           style: ButtonStyle(
          //             fixedSize: WidgetStatePropertyAll(
          //               Size(
          //                 double.infinity,
          //                 double.minPositive,
          //               ),
          //             ),
          //           ),
          //           onPressed: () => context.push(
          //             MaterialPageRoute(
          //               builder: (context) => WalletsScreen(),
          //             ),
          //           ),
          //           child: Text(
          //             "show more",
          //             style: context.textTheme.labelSmall,
          //           ),
          //         ),
          //       ],
          //     ),
          //     switch (state) {
          //       WalletsLoading _ => Shimmer.fromColors(
          //           baseColor: context.colors.outline.withOpacity(0.25),
          //           highlightColor: context.colors.surface.withOpacity(0.25),
          //           enabled: true,
          //           child: SingleChildScrollView(
          //             scrollDirection: Axis.horizontal,
          //             child: Padding(
          //               padding: const EdgeInsets.only(bottom: 24),
          //               child: Row(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisSize: MainAxisSize.max,
          //                 children: [
          //                   Skeleton(
          //                       height: 104, width: 130, borderRadius: 10),
          //                   const SizedBox(width: 16),
          //                   Skeleton(
          //                       height: 104, width: 200, borderRadius: 10),
          //                   const SizedBox(width: 16),
          //                   Skeleton(
          //                       height: 104, width: 100, borderRadius: 10),
          //                   const SizedBox(width: 16),
          //                   Skeleton(
          //                       height: 104, width: 150, borderRadius: 10),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       WalletsLoaded _ => SizedBox(
          //           height: 88,
          //           child: Padding(
          //             padding: const EdgeInsets.only(bottom: 16),
          //             child: ListView.separated(
          //               scrollDirection: Axis.horizontal,
          //               itemBuilder: (context, index) => WalletItem(
          //                 wallet: wallets[index],
          //                 isHorizontal: true,
          //               ),
          //               separatorBuilder: (context, index) =>
          //                   const SizedBox(width: 16),
          //               itemCount: wallets.length,
          //             ),
          //           ),
          //         ),
          //       _ => const SizedBox()
          //     },
          //   ],
          // );
        }
      },
    );
  }
}

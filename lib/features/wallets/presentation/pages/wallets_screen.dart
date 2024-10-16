import 'package:Dinar/app.dart';
import 'package:Dinar/core/utils/app_context.dart';
import 'package:Dinar/features/wallets/domain/entities/wallet.dart';
import 'package:Dinar/features/wallets/presentation/widgets/wallet_item.dart';
import 'package:Dinar/features/wallets/presentation/widgets/wallets_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../core/components/widgets/sheet.dart';
import '../../../../core/constants/strings.dart';
import '../../../onboarding/presentation/widgets/add_check_bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../manager/wallets_bloc.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Wallet> wallets = context.read<WalletsBloc>().wallets;

    return BlocConsumer<WalletsBloc, WalletsState>(
      listener: (context, state) {
        if (state is WalletsError) {
          context.showErrorSnackBar(massage: state.message.value);
        }
        if (state is WalletsLoaded) {
          wallets = context.read<WalletsBloc>().wallets;
        }
        if (state is WalletDeleted) {
          context.showErrorSnackBar(
              massage: "${state.wallet.name} :  was deleted");
        }
      },
      builder: (context, state) {
        if (state is WalletsLoading) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => wallets.isNotEmpty
                  ? context.pop()
                  : context.showErrorSnackBar(
                      massage: "you should add new category"),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            title: Text("${texts["app"]["wal_type"]}s"),
            actions: [
              IconButton(
                onPressed: () async {
                  final wallet = await sheet(
                      context: context, content: WalletsBottomSheet());
                  if (wallet != null) {
                    final result = await sheet(
                      context: context,
                      content: AddCheckBottomSheet(
                        type: texts["app"]["wal_type"],
                        category: null,
                        wallet: wallet,
                      ),
                    );
                    if (result) {
                      context
                          .read<WalletsBloc>()
                          .add(AddWalletEvent(wallet: wallet));
                    }
                  }
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView.separated(
              itemBuilder: (context, index) => WalletItem(
                wallet: wallets[index],
                isHorizontal: false,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: wallets.length,
            ),
          ),
        );
      },
    );
  }
}

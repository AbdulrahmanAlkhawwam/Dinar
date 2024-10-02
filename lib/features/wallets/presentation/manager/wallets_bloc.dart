import 'dart:async';

import 'package:Dinar/features/wallets/domain/use_cases/load_wallets_uc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/message.dart';
import '../../domain/entities/wallet.dart';

part 'wallets_event.dart';

part 'wallets_state.dart';

class WalletsBloc extends Bloc<WalletsEvent, WalletsState> {
  List<Wallet> wallets = [];

  final LoadWalletsUc loadWallets;

  WalletsBloc({
    required this.loadWallets,
  }) : super(WalletsInitial()) {
    on<WalletInitEvent>(_initializeWallets);
  }

  FutureOr<void> _initializeWallets(
    WalletsEvent event,
    Emitter<WalletsState> emit,
  ) async {
    emit(WalletsLoading());
    var response = await loadWallets();
    response.fold(
      (failure) => emit(WalletsError(message: Message.fromFailure(failure))),
      (wallets) {
        wallets
          ..clear()
          ..addAll(wallets);
      },
    );
    emit(WalletsLoaded(wallets: wallets));
  }
}

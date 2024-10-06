import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/load_wallets_uc.dart';
import '../../domain/use_cases/add_wallet_uc.dart';
import '../../domain/entities/wallet.dart';
import '../../../../core/utils/message.dart';

part 'wallets_event.dart';

part 'wallets_state.dart';

class WalletsBloc extends Bloc<WalletsEvent, WalletsState> {
  List<Wallet> wallets = [];

  final LoadWalletsUc loadWallets;
  final AddWalletUc addWalletUc;

  WalletsBloc({
    required this.loadWallets,
    required this.addWalletUc,
  }) : super(WalletsInitial()) {
    on<WalletInitEvent>(_initializeWallets);
    on<AddWalletEvent>(_addWallet);
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
        this.wallets
          ..clear()
          ..addAll(wallets);
      },
    );
    emit(WalletsLoaded(wallets: wallets));
  }

  FutureOr<void> _addWallet(
    AddWalletEvent event,
    Emitter<WalletsState> emit,
  ) async {
    emit(WalletsLoading());
    final response = await addWalletUc.call(param: event.wallet);
    response.fold(
        (failure) => emit(WalletsError(message: Message.fromFailure(failure))),
        (id) => emit(WalletAdded(id: id)));
  }
}

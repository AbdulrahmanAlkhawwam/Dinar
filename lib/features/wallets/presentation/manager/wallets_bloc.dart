import 'dart:async';

import 'package:Dinar/features/wallets/domain/use_cases/delete_wallet_uc.dart';
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

  final DeleteWalletUc deleteWalletUc;
  final LoadWalletsUc loadWallets;
  final AddWalletUc addWalletUc;

  WalletsBloc({
    required this.deleteWalletUc,
    required this.loadWallets,
    required this.addWalletUc,
  }) : super(WalletsInitial()) {
    on<WalletInitEvent>(_initializeWallets);
    on<AddWalletEvent>(_addWallet);
    on<DeleteWalletEvent>(_deleteWallet);
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
      (id) => emit(WalletAdded(id: id)),
    );
    add(WalletInitEvent());
  }

  FutureOr<void> _deleteWallet(
    DeleteWalletEvent event,
    Emitter<WalletsState> emit,
  ) async {
    emit(WalletsLoading());
    if (event.wallet.id == null || event.wallet.id.toString() == "") {
      print("wallet : ${event.wallet.name} don't have an id ;(");
      emit(WalletsError(message: Message("There are some error")));
    }
    final response =
        await deleteWalletUc.call(param: event.wallet.id.toString());
    response.fold(
      (failure) => emit(WalletsError(message: Message.fromFailure(failure))),
      (_) => emit(WalletDeleted(wallet: event.wallet)),
    );
    add(WalletInitEvent());
  }
}

part of 'wallets_bloc.dart';

@immutable
sealed class WalletsEvent {}

class WalletInitEvent extends WalletsEvent {}

class AddWalletEvent extends WalletsEvent {
  final Wallet wallet;

  AddWalletEvent({required this.wallet});
}

class DeleteWalletEvent extends WalletsEvent {
  final Wallet wallet;

  DeleteWalletEvent({required this.wallet});
}

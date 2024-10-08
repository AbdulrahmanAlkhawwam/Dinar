part of 'wallets_bloc.dart';

@immutable
sealed class WalletsState {}

final class WalletsInitial extends WalletsState {}

final class WalletsLoading extends WalletsState {}

final class WalletsError extends WalletsState {
  final Message message;

  WalletsError({required this.message});
}

final class WalletsLoaded extends WalletsState {
  final List<Wallet> wallets;

  WalletsLoaded({
    required this.wallets,
  });
}

final class WalletAdded extends WalletsState {
  final int id;

  WalletAdded({required this.id});
}

final class WalletDeleted extends WalletsState {
  final Wallet wallet;

  WalletDeleted({required this.wallet});
}

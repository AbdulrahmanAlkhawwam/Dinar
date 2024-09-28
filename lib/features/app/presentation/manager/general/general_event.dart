part of 'general_bloc.dart';

@immutable
sealed class GeneralEvent {}

final class InitialisationEvent extends GeneralEvent {}

final class AddCategoryEvent extends GeneralEvent {
  AddCategoryEvent({required this.category});

  final Category category;
}

final class AddWalletEvent extends GeneralEvent {
  AddWalletEvent({required this.wallet});

  final Wallet wallet;
}

final class CheckEvent extends GeneralEvent {}

part of 'operation_bloc.dart';

@immutable
abstract class OperationEvent {}

class LoadOperationsEvent extends OperationEvent {}

class AddOperationEvent extends OperationEvent {
  final Operation operation;

  AddOperationEvent({required this.operation});
}

class GetCategoryOperationEvent extends OperationEvent {
  final Category category;

  GetCategoryOperationEvent({required this.category});
}

class GetWalletOperationEvent extends OperationEvent {
  final Wallet wallet;

  GetWalletOperationEvent({required this.wallet});
}

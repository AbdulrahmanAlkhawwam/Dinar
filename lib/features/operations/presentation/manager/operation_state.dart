part of 'operation_bloc.dart';

@immutable
abstract class OperationState {}

final class OperationInitial extends OperationState {}

final class OperationLoading extends OperationState {}

final class OperationError extends OperationState {
  final Message message;

  OperationError({required this.message});
}

final class OperationLoaded extends OperationState {
  final List<Operation> operations;

  OperationLoaded({
    required this.operations,
  });
}

final class CategoryOperationLoaded extends OperationState {
  final List<Operation> operations;

  CategoryOperationLoaded({required this.operations});
}

final class WalletOperationLoaded extends OperationState {
  final List<Operation> operations;

  WalletOperationLoaded({required this.operations});
}

final class OperationAdding extends OperationState {}

final class OperationAdded extends OperationState {}

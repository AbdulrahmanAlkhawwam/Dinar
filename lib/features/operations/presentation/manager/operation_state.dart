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
  final List<Operation> incomesOperation;
  final List<Operation> paymentsOperation;

  OperationLoaded({
    required this.incomesOperation,
    required this.paymentsOperation,
  });
}

final class OperationAdding extends OperationState {}

final class OperationAdded extends OperationState {}

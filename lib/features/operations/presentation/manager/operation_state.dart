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

final class OperationAdding extends OperationState {}

final class OperationAdded extends OperationState {}

final class OperationDeleted extends OperationState {
  final Operation operation;

  OperationDeleted({required this.operation});
}

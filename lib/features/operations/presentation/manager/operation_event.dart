part of 'operation_bloc.dart';

@immutable
abstract class OperationEvent {}

class LoadOperationsEvent extends OperationEvent {}

class AddOperationEvent extends OperationEvent {
  final Operation operation;

  AddOperationEvent({required this.operation});
}

class DeleteOperationEvent extends OperationEvent {
  final Operation operation;

  DeleteOperationEvent({required this.operation});
}

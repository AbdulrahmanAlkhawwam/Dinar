part of 'operation_bloc.dart';

@immutable
abstract class OperationEvent {}

class LoadOperationsEvent extends OperationEvent {}

class AddOperationEvent extends OperationEvent {
  final Operation operation;

  AddOperationEvent({required this.operation});
}

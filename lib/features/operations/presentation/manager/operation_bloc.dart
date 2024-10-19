import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/message.dart';
import '../../domain/entities/operation.dart';
import '../../domain/use_cases/add_operation_uc.dart';
import '../../domain/use_cases/load_income_operations_uc.dart';
import '../../domain/use_cases/load_payment_operations_uc.dart';

part 'operation_event.dart';

part 'operation_state.dart';

class OperationBloc extends Bloc<OperationEvent, OperationState> {
  List<Operation> incomesOperation = [];
  List<Operation> paymentsOperation = [];

  final LoadIncomeOperationsUc loadIncomesOperationUc;
  final LoadPaymentOperationsUc loadPaymentOperationsUc;
  final AddOperationUc addOperationUc;

  OperationBloc({
    required this.loadIncomesOperationUc,
    required this.loadPaymentOperationsUc,
    required this.addOperationUc,
  }) : super(OperationInitial()) {
    on<LoadOperationsEvent>(_loadOperations);
    on<AddOperationEvent>(_addOperation);
  }

  FutureOr<void> _loadOperations(
    LoadOperationsEvent event,
    Emitter<OperationState> emit,
  ) async {
    emit(OperationLoading());
    var response = await loadIncomesOperationUc();
    response.fold(
      (failure) => emit(OperationError(message: Message.fromFailure(failure))),
      (operations) => incomesOperation
        ..clear()
        ..addAll(operations),
    );
    response = await loadPaymentOperationsUc();
    response.fold(
      (failure) => emit(OperationError(message: Message.fromFailure(failure))),
      (operations) => paymentsOperation
        ..clear()
        ..addAll(operations),
    );
    emit(OperationLoaded(
      incomesOperation: incomesOperation,
      paymentsOperation: paymentsOperation,
    ));
  }

  FutureOr<void> _addOperation(
    AddOperationEvent event,
    Emitter<OperationState> emit,
  ) async {
    emit(OperationAdded());
    final response = await addOperationUc.call(param: event.operation);
    response.fold(
      (failure) => emit(OperationError(message: Message.fromFailure(failure))),
      (id) {
        emit(OperationAdded());
      },
    );
  }
}

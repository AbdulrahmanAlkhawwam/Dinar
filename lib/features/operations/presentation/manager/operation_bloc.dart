import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/message.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../wallets/domain/entities/wallet.dart';
import '../../domain/entities/operation.dart';
import '../../domain/use_cases/add_operation_uc.dart';
import '../../domain/use_cases/delete_operation_uc.dart';
import '../../domain/use_cases/load_category_operation_uc.dart';
import '../../domain/use_cases/load_operations_uc.dart';
import '../../domain/use_cases/load_wallet_operation_uc.dart';

part 'operation_event.dart';

part 'operation_state.dart';

class OperationBloc extends Bloc<OperationEvent, OperationState> {
  final LoadOperationsUc loadOperationsUc;
  final LoadCategoryOperationUc loadCategoryOperationUc;
  final LoadWalletOperationUc loadWalletOperationUc;
  final AddOperationUc addOperationUc;
  final DeleteOperationUc deleteOperationUc;

  OperationBloc({
    required this.loadOperationsUc,
    required this.loadCategoryOperationUc,
    required this.loadWalletOperationUc,
    required this.deleteOperationUc,
    required this.addOperationUc,
  }) : super(OperationInitial()) {
    on<LoadOperationsEvent>(_loadOperations);
    on<AddOperationEvent>(_addOperation);
    on<DeleteOperationEvent>(_deleteOperation);
  }

  FutureOr<void> _loadOperations(
    LoadOperationsEvent event,
    Emitter<OperationState> emit,
  ) async {
    emit(OperationLoading());
    var response = await loadOperationsUc();
    response.fold(
      (failure) => emit(OperationError(message: Message.fromFailure(failure))),
      (operations) => emit(OperationLoaded(operations: operations)),
    );
  }

  FutureOr<void> _addOperation(
    AddOperationEvent event,
    Emitter<OperationState> emit,
  ) async {
    emit(OperationAdded());
    final response = await addOperationUc.call(param: event.operation);
    response.fold(
      (failure) => emit(OperationError(message: Message.fromFailure(failure))),
      (id) => emit(OperationAdded()),
    );
    add(LoadOperationsEvent());
  }

  FutureOr<void> _deleteOperation(
      DeleteOperationEvent event, Emitter<OperationState> emit) async {
    emit(OperationLoading());
    final response = await deleteOperationUc.call(param: event.operation.id!);
    response.fold(
      (failure) => emit(OperationError(message: Message.fromFailure(failure))),
      (_) => emit(OperationDeleted(operation: event.operation)),
    );
    add(LoadOperationsEvent());
  }
}

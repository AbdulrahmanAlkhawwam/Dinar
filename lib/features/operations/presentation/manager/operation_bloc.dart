import 'dart:async';

import 'package:Dinar/features/app/domain/entities/operation_type.dart';
import 'package:Dinar/features/operations/domain/use_cases/load_category_operation_uc.dart';
import 'package:Dinar/features/operations/domain/use_cases/load_wallet_operation_uc.dart';
import 'package:Dinar/features/wallets/domain/entities/wallet.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/message.dart';
import '../../../categories/domain/entities/category.dart';
import '../../domain/entities/operation.dart';
import '../../domain/use_cases/add_operation_uc.dart';
import '../../domain/use_cases/load_operations_uc.dart';

part 'operation_event.dart';

part 'operation_state.dart';

class OperationBloc extends Bloc<OperationEvent, OperationState> {
  final LoadOperationsUc loadOperationsUc;
  final LoadCategoryOperationUc loadCategoryOperationUc;
  final LoadWalletOperationUc loadWalletOperationUc;
  final AddOperationUc addOperationUc;

  OperationBloc({
    required this.loadOperationsUc,
    required this.loadCategoryOperationUc,
    required this.loadWalletOperationUc,
    required this.addOperationUc,
  }) : super(OperationInitial()) {
    on<LoadOperationsEvent>(_loadOperations);
    on<AddOperationEvent>(_addOperation);
    on<GetCategoryOperationEvent>(_getCategoryOperation);
    on<GetWalletOperationEvent>(_getWalletOperation);
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
      (id) {
        emit(OperationAdded());
      },
    );
  }

  FutureOr<void> _getCategoryOperation(
      GetCategoryOperationEvent event, Emitter<OperationState> emit) async {
    emit(OperationLoading());
    final response = await loadCategoryOperationUc.call(param: event.category);
    response.fold(
      (failure) => emit(OperationError(message: Message.fromFailure(failure))),
      (operation) => emit(CategoryOperationLoaded(operations: operation)),
    );
  }

  FutureOr<void> _getWalletOperation(
      GetWalletOperationEvent event, Emitter<OperationState> emit) async {
    emit(OperationLoading());
    final response = await loadWalletOperationUc.call(param: event.wallet);
    response.fold(
      (failure) => emit(OperationError(message: Message.fromFailure(failure))),
      (operation) => emit(WalletOperationLoaded(operations: operation)),
    );
  }
}

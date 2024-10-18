import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/income.dart';
import '../../domain/use_cases/add_income_uc.dart';
import '../../domain/use_cases/load_incomes_uc.dart';
import '../../../../core/utils/message.dart';

part 'income_event.dart';

part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  List<Income> incomes = [];

  final LoadIncomesUc loadIncomesUc;
  final AddIncomeUc addIncomeUc;

  IncomeBloc({
    required this.loadIncomesUc,
    required this.addIncomeUc,
  }) : super(IncomeInitial()) {
    on<IncomeInitEvent>(_initializeIncomes);
    on<AddIncomeEvent>(_addIncome);
  }

  FutureOr<void> _initializeIncomes(
    IncomeInitEvent event,
    Emitter<IncomeState> emit,
  ) async {
    final response = await loadIncomesUc();
    response.fold(
      (failure) => emit(IncomeError(message: Message.fromFailure(failure))),
      (incomes) {
        this.incomes
          ..clear()
          ..addAll(incomes);
        emit(IncomeLoaded(incomes: incomes));
      },
    );
  }

  FutureOr<void> _addIncome(
    AddIncomeEvent event,
    Emitter<IncomeState> emit,
  ) async {
    emit(IncomeAdding());
    print("income in bloc is ${event.income.toString()}");
    final response = await addIncomeUc.call(param: event.income);
    response.fold(
      (failure) => emit(IncomeError(message: Message.fromFailure(failure))),
      (id) {
        emit(IncomeAdded());
      },
    );
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../incomes/domain/entities/income.dart';
import '../../../incomes/domain/use_cases/load_incomes_uc.dart';
import '../../../../core/utils/message.dart';

part 'income_event.dart';

part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  List<Income> incomes = [];

  final LoadIncomesUc loadIncomesUc;

  IncomeBloc({required this.loadIncomesUc}) : super(IncomeInitial()) {
    on<IncomeInitEvent>(_initializeIncomes);
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
}

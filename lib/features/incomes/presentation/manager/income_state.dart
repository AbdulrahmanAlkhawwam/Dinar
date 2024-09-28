part of 'income_bloc.dart';

@immutable
sealed class IncomeState {}

final class IncomeInitial extends IncomeState {}

final class IncomeLoading extends IncomeState {}

final class IncomeError extends IncomeState {
  final Message message;

  IncomeError({required this.message});
}

final class IncomeLoaded extends IncomeState {
  final List<Income> incomes;

  IncomeLoaded({required this.incomes});
}

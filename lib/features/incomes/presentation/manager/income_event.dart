part of 'income_bloc.dart';

@immutable
abstract class IncomeEvent {}

class IncomeInitEvent extends IncomeEvent {}

class AddIncomeEvent extends IncomeEvent {
  final Income income;

  AddIncomeEvent({required this.income});
}

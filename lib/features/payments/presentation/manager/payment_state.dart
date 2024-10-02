part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentError extends PaymentState {
  final Message message;

  PaymentError({required this.message});
}

final class PaymentLoaded extends PaymentState {
  final List<Payment> payments;

  PaymentLoaded({required this.payments});
}

final class PaymentAdding extends PaymentState {}

final class PaymentAdded extends PaymentState {}

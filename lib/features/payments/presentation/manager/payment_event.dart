part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class PaymentInitEvent extends PaymentEvent {}

class AddPaymentEvent extends PaymentEvent {
  final Payment payment;

  AddPaymentEvent({required this.payment});
}

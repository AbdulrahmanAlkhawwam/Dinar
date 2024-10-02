import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/payment.dart';
import '../../domain/use_cases/load_payments_uc.dart';
import '../../domain/use_cases/add_payment_uc.dart';
import '../../../../core/utils/message.dart';

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  List<Payment> payments = [];

  final LoadPaymentsUc loadPaymentsUc;
  final AddPaymentUc addPaymentUc;

  PaymentBloc({
    required this.addPaymentUc,
    required this.loadPaymentsUc,
  }) : super(PaymentInitial()) {
    on<PaymentInitEvent>(_initializePayments);
    on<AddPaymentEvent>(_addPayment);
  }

  FutureOr<void> _initializePayments(
    PaymentInitEvent event,
    Emitter<PaymentState> emit,
  ) async {
    final response = await loadPaymentsUc();
    response.fold(
      (failure) => emit(PaymentError(message: Message.fromFailure(failure))),
      (payments) {
        this.payments
          ..clear()
          ..addAll(payments);
        emit(PaymentLoaded(payments: this.payments));
      },
    );
  }

  FutureOr<void> _addPayment(
    AddPaymentEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(PaymentAdding());
    final response = await addPaymentUc.call(param: event.payment);
    response.fold(
      (failure) => emit(PaymentError(message: Message.fromFailure(failure))),
      (id) {
        emit(PaymentAdded());
      },
    );
  }
}

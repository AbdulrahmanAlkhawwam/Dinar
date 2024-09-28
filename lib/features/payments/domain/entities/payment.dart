import '../../../app/domain/entities/operation.dart';
import '../../../app/domain/entities/operation_type.dart';

class Payment extends Operation {
  final type = OperationType.payment;

  Payment(
    super.id, {
    required super.name,
    required super.value,
    required super.description,
    required super.categoryId,
    required super.walletId,
    required super.date,
  });
}

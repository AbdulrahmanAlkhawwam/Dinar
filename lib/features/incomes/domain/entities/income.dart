import '../../../app/domain/entities/operation_type.dart';
import '../../../app/domain/entities/operation.dart';

class Income extends Operation {
  final type = OperationType.income;

  Income(
    super.id, {
    required super.name,
    required super.value,
    required super.description,
    required super.categoryId,
    required super.walletId,
    required super.date,
    required super.category,
    required super.wallet,
  });
}

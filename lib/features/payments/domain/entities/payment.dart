import 'package:Dinar/features/categories/domain/entities/category.dart';

import 'package:Dinar/features/wallets/domain/entities/wallet.dart';

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
    required super.category,
    required super.wallet,
  });

  @override
  Operation copyWith({
    String? id,
    String? name,
    double? value,
    String? description,
    String? categoryId,
    String? walletId,
    Category? category,
    Wallet? wallet,
    DateTime? date,
  }) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }
}

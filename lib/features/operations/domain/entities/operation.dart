import 'package:uuid/uuid.dart';

import '../../../app/domain/entities/operation_type.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../wallets/domain/entities/wallet.dart';

final uuid = Uuid();

class Operation {
  String? id;
  final String name;
  final double value;
  final String? description;
  final String categoryId;
  final String walletId;
  late Category? category;
  late Wallet? wallet;
  final DateTime date;
  final OperationType type;

  Operation(
    this.id, {
    required this.name,
    required this.value,
    required this.description,
    required this.categoryId,
    required this.walletId,
    required this.date,
    required this.type,
    this.category,
    this.wallet,
  }) {
    id ??= uuid.v4();
  }

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
    OperationType? type,
  }) =>
      Operation(
        id ?? this.id,
        name: name ?? this.name,
        value: value ?? this.value,
        description: description ?? this.description,
        categoryId: categoryId ?? this.categoryId,
        walletId: walletId ?? this.walletId,
        date: date ?? this.date,
        type: type ?? this.type,
      );
}

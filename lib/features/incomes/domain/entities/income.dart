import 'package:uuid/uuid.dart';

import '../../../app/domain/entities/operation_type.dart';
import '../../../app/domain/entities/operation.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../wallets/domain/entities/wallet.dart';

final uuid = Uuid();

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
  }) {
    id ??= "ope--inc--${uuid.v4()}";
  }

  @override
  Income copyWith({
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
    return Income(
      id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      walletId: walletId ?? this.walletId,
      date: date ?? this.date,
      category: category ?? this.category,
      wallet: wallet ?? this.wallet,
    );
  }

  @override
  String toString() {
    return "category {"
        "id : $id ,"
        "name : $name ,"
        "value : $value ,"
        "description : $description ,"
        "category-id : $categoryId ,"
        "wallet-id : $walletId ,"
        "type : $type ,"
        "date : $date ,"
        "category : ${category.toString()} ,"
        "wallet : ${wallet.toString()} ,"
        "}";
  }
}

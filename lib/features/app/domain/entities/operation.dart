import '../../../categories/domain/entities/category.dart';
import '../../../incomes/domain/entities/income.dart';
import '../../../wallets/domain/entities/wallet.dart';

abstract class Operation {
  String? id;
  final String name;
  final double value;
  final String? description;
  final String categoryId;
  final String walletId;
  late Category? category;
  late Wallet? wallet;
  final DateTime date;

  Operation(
    this.id, {
    required this.name,
    required this.value,
    required this.description,
    required this.categoryId,
    required this.walletId,
    required this.date,
    this.category,
    this.wallet,
  });

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
  });
}

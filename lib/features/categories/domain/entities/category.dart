import '../../../app/domain/entities/operation_type.dart';

class Category {
  final String? id;
  final String name;
  final OperationType type;
  final double? balance;

  Category(
    this.id, {
    required this.name,
    required this.type,
    this.balance,
  });

  Category copyWith({
    String? id,
    String? name,
    OperationType? type,
    double? balance,
  }) {
    return Category(
      id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      balance: balance ?? this.balance,
    );
  }
}

import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Wallet {
  String? id;
  final String name;
  final double? balance;

  Wallet({
    this.id,
    required this.name,
    this.balance,
  }) {
    id ??= uuid.v4();
  }

  Wallet copyWith({
    String? id,
    String? name,
    double? balance,
  }) {
    return Wallet(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
    );
  }
}

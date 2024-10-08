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
    id ??= "wal--${uuid.v4()}";
  }

  Wallet copyWith({
    String? name,
  }) {
    return Wallet(
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return "wallet {"
        "id : $id ,"
        "name : $name ,"
        "balance : $balance"
        "}";
  }
}

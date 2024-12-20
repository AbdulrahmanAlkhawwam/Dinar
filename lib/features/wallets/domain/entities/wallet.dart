import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Wallet {
  String? id;
  final String name;
  double? incomesTotal;
  double? paymentsTotal;

  Wallet({
    this.id,
    required this.name,
    this.incomesTotal,
    this.paymentsTotal,
  }) {
    id ??= "wal--${uuid.v4()}";
  }

  Wallet copyWith({String? name}) => Wallet(name: name ?? this.name);

  @override
  String toString() => "wallet { "
      "id : $id ,"
      "name : $name ,"
      "incomes : $incomesTotal ,"
      "payments : $incomesTotal "
      "}";
}

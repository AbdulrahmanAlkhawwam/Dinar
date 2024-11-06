import 'package:uuid/uuid.dart';

import '../../../app/domain/entities/operation_type.dart';

final uuid = Uuid();

class Category {
  String? id;
  final String name;
  final OperationType type;
  final double? balance;

  Category({
    this.id,
    required this.name,
    required this.type,
    this.balance,
  }) {
    id ??= "cat--${uuid.v4()}";
  }

  Category copyWith({String? name, OperationType? type}) =>
      Category(name: name ?? this.name, type: type ?? this.type);

  @override
  String toString() => "category {"
      "id : $id ,"
      "name : $name ,"
      "type : $type ,"
      "balance : $balance"
      "}";
}

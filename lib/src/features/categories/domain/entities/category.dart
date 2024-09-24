import 'package:Dinar/src/features/app/domain/entities/operation_type.dart';

class Category {
  final String? id;
  final String name;
  final OperationType type;

  Category(
    this.id, {
    required this.name,
    required this.type,
  });
}

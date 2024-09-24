abstract class Operation {
  final String? id;
  final String name;
  final double value;
  final String? description;
  final String categoryId;
  final String walletId;
  final DateTime date;

  Operation(
    this.id, {
    required this.name,
    required this.value,
    required this.description,
    required this.categoryId,
    required this.walletId,
    required this.date,
  });
}

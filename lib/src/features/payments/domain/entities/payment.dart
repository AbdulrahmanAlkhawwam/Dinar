class Payment {
  final String id;

  final String name;

  final double value;

  final String? description;

  final String categoryId;

  final String walletId;

  final DateTime date;

  final String type; // it should be income / payment

  Payment(
    this.id, {
    required this.name,
    required this.value,
    required this.description,
    required this.categoryId,
    required this.walletId,
    required this.date,
    required this.type,
  });
}

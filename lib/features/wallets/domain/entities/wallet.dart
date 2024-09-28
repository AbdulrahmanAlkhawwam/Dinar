class Wallet {
  final String? id;
  final String name;
  final double? balance;

  Wallet(
    this.id, {
    required this.name,
    this.balance,
  });

  Wallet copyWith({
    String? id,
    String? name,
    double? balance,
  }) {
    return Wallet(
      id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
    );
  }
}

enum TransactionType {
  withdrawal,
  deposit,
  payment,
  revenue,
  interest,
  debitTransfer,
  creditTransfer,
}

class Transaction {
  static const _creditTransactions = [
    TransactionType.deposit,
    TransactionType.revenue,
    TransactionType.creditTransfer,
  ];

  final TransactionType type;
  final DateTime date;
  final String? description;
  late final double _value;

  Transaction({
    required this.type,
    required this.date,
    required double value,
    this.description,
  }) {
    _setValue(value);
  }

  Transaction.now({
    required this.type,
    required double value,
    this.description,
  }) : date = DateTime.now() {
    _setValue(value);
  }

  void _setValue(double value) {
    if (value.isNegative) {
      throw Exception('Negative trasaction value');
    }
    _value = isDebit ? -value : value;
  }

  double get value => _value;

  bool get isCredit => _creditTransactions.contains(type);

  bool get isDebit => !_creditTransactions.contains(type);
}

enum TransactionNature {
  credit,
  debit,
}

enum TransactionType {
  withdrawal,
  deposit,
  payment,
  revenue,
  interest,
  transfer,
}

class Transaction {
  final TransactionType type;
  final DateTime date;
  final String? description;
  late final double _value;

  Transaction({
    required TransactionNature nature,
    required this.type,
    required this.date,
    required double value,
    this.description,
  }) {
    _setValue(value, nature);
  }

  Transaction.now({
    required TransactionNature nature,
    required this.type,
    required double value,
    this.description,
  }) : date = DateTime.now() {
    _setValue(value, nature);
  }

  void _setValue(double value, TransactionNature nature) {
    if (value.isNegative) {
      throw Exception('Negative trasaction value');
    }
    _value = (nature == TransactionNature.credit) ? value : -value;
  }

  double get value => _value;

  bool get isCredit => _value >= 0.0;

  bool get isDebit => _value < 0.0;
}

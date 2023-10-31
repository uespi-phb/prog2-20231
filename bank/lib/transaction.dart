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
  final double value;
  final String? description;

  Transaction({
    required this.type,
    required this.value,
    required this.date,
    this.description,
  });

  Transaction.now({
    required this.type,
    required this.value,
    this.description,
  }) : date = DateTime.now();

  static bool isCredit(TransactionType type) =>
      _creditTransactions.contains(type);
  static bool isDebit(TransactionType type) =>
      !_creditTransactions.contains(type);
}

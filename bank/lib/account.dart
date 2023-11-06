import './transaction.dart';

abstract class Account {
  final int agency;
  final int number;
  final String clientName;

  final List<Transaction> transactions = [];

  Account({
    required this.agency,
    required this.number,
    required this.clientName,
  });

  double get balance {
    double sum = 0.0;

    for (var trans in transactions) {
      sum += trans.value;
    }
    return sum;
  }

  void addTransaction(
    TransactionType type,
    double value, [
    DateTime? date,
    String? description,
  ]) {
    transactions.add(Transaction(
      type: type,
      value: value,
      date: date ?? DateTime.now(),
      description: description,
    ));
  }

  void _checkBalance(double value) {
    if (value > balance) {
      throw Exception('Insufficient funds');
    }
  }

  void deposit(double value) {
    addTransaction(TransactionType.deposit, value);
  }

  void withdrawal(double value) {
    _checkBalance(value);
    addTransaction(TransactionType.withdrawal, value);
  }

  void payment(double value) {
    _checkBalance(value);

    addTransaction(TransactionType.payment, value);
  }
}

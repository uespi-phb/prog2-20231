import './transaction.dart';
import './utils.dart';

enum AccountType {
  current,
  special,
  investment,
  saving,
}

abstract class Account {
  final AccountType type;
  final int agency;
  final int number;
  final String clientName;

  final List<Transaction> transactions = [];

  Account({
    required this.type,
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
    TransactionNature nature,
    TransactionType type,
    double value, {
    DateTime? date,
    String? description,
  }) {
    transactions.add(Transaction(
      nature: nature,
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
    addTransaction(
      TransactionNature.credit,
      TransactionType.deposit,
      value,
    );
  }

  void withdrawal(double value) {
    _checkBalance(value);
    addTransaction(
      TransactionNature.debit,
      TransactionType.withdrawal,
      value,
    );
  }

  void payment(double value) {
    _checkBalance(value);
    addTransaction(
      TransactionNature.debit,
      TransactionType.payment,
      value,
    );
  }

  void transferTo(Account account, double value) {
    _checkBalance(value);
    addTransaction(
      TransactionNature.debit,
      TransactionType.transfer,
      value,
      description: 'TRANSF P/ AG.${account.agency} CC.${account.number}',
    );
    account.addTransaction(
      TransactionNature.credit,
      TransactionType.transfer,
      value,
      description: 'TRANSF DE AG.$agency CC.$number',
    );
  }

  String get typeName {
    switch (type) {
      case AccountType.current:
        return 'CORRENTE';
      case AccountType.special:
        return 'ESPECIAL';
      case AccountType.investment:
        return 'INVESTIMENTO';
      case AccountType.saving:
        return 'POUPANÇA';
    }
  }

  void statement() {
    statementHeader();
    statementBody();
    statementFooter();
  }

  void statementHeader() {
    const width = 40;
    const dateWidth = 6;
    const valueWidth = 12;
    const tabs = [
      dateWidth,
      (width - dateWidth - valueWidth),
      -valueWidth,
    ];

    centerPrint('BANCO EXEMPLO S/A', width);
    centerPrint('EXTRATO DE CONTA $typeName', width);
    centerPrint('$agency/$number ${clientName.toUpperCase()}', width);
    print('-' * width);
    tabPrint('DATA\tTRANSAÇÃO\tVALOR', tabs);
  }

  void statementBody() {
    const width = 40;
    const dateWidth = 6;
    const valueWidth = 12;
    const tabs = [
      dateWidth,
      (width - dateWidth - valueWidth),
      -valueWidth,
    ];
    for (var t in transactions) {
      var date = dateToDDMM(t.date);
      var desc = t.description;
      var value = valueToString(t.value);
      tabPrint('$date\t$desc\t$value', tabs);
    }
  }

  void statementFooter() {}
}

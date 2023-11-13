import './transaction.dart';
import './utils.dart';

enum AccountType {
  current,
  special,
  investment,
  saving,
}

class StatementData {
  static const width = 40;
  static const dateWidth = 6;
  static const valueWidth = 12;
  static const tabs = [
    dateWidth,
    (width - dateWidth - valueWidth),
    -valueWidth,
  ];
}

abstract class Account {
  static int lastNumber = 1000;

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

  Account.auto({
    required this.type,
    required this.agency,
    required this.clientName,
  }) : number = ++lastNumber;

  @override
  String toString() {
    return '${type.name}($agency, $number, $clientName)';
  }

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
    centerPrint('BANCO EXEMPLO S/A', StatementData.width);
    centerPrint('EXTRATO DE CONTA $typeName', StatementData.width);
    centerPrint(
        '$agency/$number ${clientName.toUpperCase()}', StatementData.width);
    print('-' * StatementData.width);
    tabPrint('DATA\tTRANSAÇÃO\tVALOR', StatementData.tabs);
  }

  void statementBody() {
    for (var t in transactions) {
      var date = dateToDDMM(t.date);
      var desc = t.description;
      var value = valueToString(t.value);
      tabPrint('$date\t$desc\t$value', StatementData.tabs);
    }
  }

  void statementFooter() {
    var tabs = List<int>.from(StatementData.tabs);

    tabs[1] = -tabs[1];

    print('-' * StatementData.width);
    tabPrint('\tSALDO\t$balance', tabs);
  }
}

import 'package:bank/utils.dart';

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
  static const _transactionTypeName = {
    TransactionType.withdrawal: 'SAQUE',
    TransactionType.deposit: 'DEPÓSITO',
    TransactionType.payment: 'PAGAMENTO',
    TransactionType.revenue: 'RENDIMENTO',
    TransactionType.interest: 'JUROS',
    TransactionType.transfer: 'TRANSFERÊNCIA',
  };

  final TransactionType type;
  final DateTime date;
  late final double _value;
  final String? _description;

  Transaction({
    required TransactionNature nature,
    required this.type,
    required this.date,
    required double value,
    String? description,
  }) : _description = description {
    _setValue(value, nature);
  }

  Transaction.now({
    required TransactionNature nature,
    required this.type,
    required double value,
    String? description,
  })  : date = DateTime.now(),
        _description = description {
    _setValue(value, nature);
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'date': date.toIso8601String().substring(0, 19),
      'value': _value.toFixed(4),
      'desc': _description,
    };
  }

  void _setValue(double value, TransactionNature nature) {
    if (value.isNegative) {
      throw Exception('Negative trasaction value');
    }
    _value = (nature == TransactionNature.credit) ? value : -value;
  }

  // String get description {
  //   if (_description != null) {
  //     return _description!;
  //   }
  //   switch (type) {
  //     case TransactionType.withdrawal:
  //       return 'SAQUE';
  //     case TransactionType.deposit:
  //       return 'DEPÓSITO';
  //     case TransactionType.payment:
  //       return 'PAGAMENTO';
  //     case TransactionType.revenue:
  //       return 'REDIMENTO';
  //     case TransactionType.interest:
  //       return 'JUROS';
  //     case TransactionType.transfer:
  //       return 'TRANSFERÊNCIA';
  //   }
  // }

  String get description => _description ?? _transactionTypeName[type]!;

  double get value => _value;

  bool get isCredit => _value >= 0.0;

  bool get isDebit => _value < 0.0;
}

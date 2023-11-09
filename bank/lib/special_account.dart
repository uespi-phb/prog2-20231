import './account.dart';
import './utils.dart';

class SpecialAccount extends Account {
  final double limit;

  SpecialAccount({
    required super.agency,
    required super.number,
    required super.clientName,
    required this.limit,
  }) : super(type: AccountType.special);

  @override
  double get balance {
    return super.balance + limit;
  }

  @override
  void statementFooter() {
    var tabs = List<int>.from(StatementData.tabs);
    tabs[1] = -tabs[1];

    var fBalance = valueToString(super.balance, decimalPrecision: 0);
    var fLimit = valueToString(limit);
    var fAvailable = valueToString(balance);

    print('-' * StatementData.width);
    tabPrint('\tSALDO\t$fBalance', tabs);
    tabPrint('\tLIMITE\t$fLimit', tabs);
    tabPrint('\tDISPONÍVEL\t$fAvailable', tabs);
  }
}

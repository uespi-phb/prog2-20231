import 'package:bank/account.dart';

import './revenue_account.dart';

class InvestmentAccount extends RevenueAccount {
  static const _yieldPeriodInDays = 1;

  InvestmentAccount({
    required super.agency,
    required super.number,
    required super.clientName,
    required super.yieldRatePerYear,
  }) : super(
          type: AccountType.investment,
          yieldPeriodInDays: _yieldPeriodInDays,
        );
}

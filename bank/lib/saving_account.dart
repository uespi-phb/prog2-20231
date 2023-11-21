import './account.dart';
import './revenue_account.dart';

class SavingAccount extends RevenueAccount {
  static const _yieldRatePerYear = 6.00;
  static const _yieldPeriodInDays = 30;

  SavingAccount({
    required super.agency,
    required super.number,
    required super.clientName,
  }) : super(
          type: AccountType.saving,
          yieldRatePerYear: _yieldRatePerYear,
          yieldPeriodInDays: _yieldPeriodInDays,
        );

  factory SavingAccount.fromMap(Map<String, dynamic> map) => SavingAccount(
        agency: map['agency'],
        number: map['number'],
        clientName: map['name'],
      );
}

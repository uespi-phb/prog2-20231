import './account.dart';

abstract class RevenueAccount extends Account {
  final double yieldRatePerYear;
  final int yieldPeriodInDays;

  RevenueAccount({
    required super.type,
    required super.agency,
    required super.number,
    required super.clientName,
    required this.yieldRatePerYear,
    required this.yieldPeriodInDays,
  });
}

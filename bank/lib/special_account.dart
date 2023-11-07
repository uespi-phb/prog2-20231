import './account.dart';

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
}

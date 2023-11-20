import './account.dart';

class CurrentAccount extends Account {
  CurrentAccount({
    required super.agency,
    required super.number,
    required super.clientName,
  }) : super(type: AccountType.current);
}

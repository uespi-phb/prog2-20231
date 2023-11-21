import './account.dart';

class CurrentAccount extends Account {
  CurrentAccount({
    required super.agency,
    required super.number,
    required super.clientName,
  }) : super(type: AccountType.current);

  factory CurrentAccount.fromMap(Map<String, dynamic> map) => CurrentAccount(
        agency: map['agency'],
        number: map['number'],
        clientName: map['name'],
      );
}

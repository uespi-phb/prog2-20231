import './account.dart';

class CurrentAccount extends Account {
  // CurrentAccount({
  //   required int agency,
  //   required int number,
  //   required String clientName,
  // }) : super(
  //         agency: agency,
  //         number: number,
  //         clientName: clientName,
  //       );

  CurrentAccount({
    required super.agency,
    required super.number,
    required super.clientName,
  }) : super(type: AccountType.current);
}

import 'package:bank/current_account.dart';
import 'package:bank/special_account.dart';

void main() {
  var c = CurrentAccount(
    agency: 123,
    number: 123456,
    clientName: 'Fulano de Tal',
  );
  var s = SpecialAccount(
    agency: 645,
    number: 98755,
    clientName: 'Cicrano da Silva',
    limit: 1000.00,
  );

  s.deposit(123456.92);
  s.withdrawal(100.00);

  s.statement();
}

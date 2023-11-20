import 'package:bank/bank.dart';

void main() {
  Bank bank = Bank('BANCO EXEMPLO S/A', seed: 100);

  bank.generateFakeAccounts(5);

  bank.saveAccountsAsJson('./accounts.json');
}

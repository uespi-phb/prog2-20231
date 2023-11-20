import 'package:faker/faker.dart';

import './account.dart';
import './current_account.dart';
import './investment_account.dart';
import './saving_account.dart';
import './special_account.dart';
import './transaction.dart';

class Bank {
  final String name;
  final int? seed;

  final List<Account> accounts = [];

  Bank(this.name, {this.seed});

  void generateFakeAccounts(int count) {
    var faker = Faker(seed: seed);

    Account account;

    accounts.clear();

    while (count-- > 0) {
      var type = faker.randomGenerator.element(AccountType.values);
      var agency = faker.randomGenerator.integer(1000, min: 100);
      var number = faker.randomGenerator.integer(10000, min: 1000);
      var name = faker.person.name();

      switch (type) {
        case AccountType.current:
          account = CurrentAccount(
            agency: agency,
            number: number,
            clientName: name,
          );
          break;
        case AccountType.special:
          account = SpecialAccount(
            agency: agency,
            number: number,
            clientName: name,
            limit: faker.randomGenerator.integer(100, min: 10) * 100.00,
          );
          break;
        case AccountType.saving:
          account = SavingAccount(
            agency: agency,
            number: number,
            clientName: name,
          );
          break;
        case AccountType.investment:
          account = InvestmentAccount(
            agency: agency,
            number: number,
            clientName: name,
            yieldRatePerYear:
                faker.randomGenerator.decimal(min: 6.50, scale: 20.00),
          );
          break;
      }

      generateFakeTransactions(account);

      accounts.add(account);
    }
  }

  void generateFakeTransactions(Account account, {int? transactionsCount}) {
    const transactions = <TransactionType>[
      TransactionType.withdrawal,
      TransactionType.deposit,
      TransactionType.payment,
      TransactionType.transfer,
    ];
    var faker = Faker();
    double value;

    var count = transactionsCount ?? faker.randomGenerator.integer(21, min: 10);
    var date = DateTime(2020, 1, 1);

    value = faker.randomGenerator.integer(1001, min: 10) * 10.0;
    account.deposit(value, date: date);

    while (count-- > 0) {
      var type = faker.randomGenerator.element(transactions);

      date = date.add(Duration(
        hours: faker.randomGenerator.integer(121, min: 2),
      ));

      switch (type) {
        case TransactionType.withdrawal:
          value = faker.randomGenerator.decimal(
            scale: account.balance / 2.0,
            min: 1,
          );
          account.withdrawal(value, date: date);
          break;
        case TransactionType.payment:
          value = faker.randomGenerator.decimal(
            scale: account.balance / 2.0,
            min: 1,
          );
          account.payment(value, date: date);
          break;
        case TransactionType.deposit:
          value = faker.randomGenerator.decimal(
            scale: 1000,
            min: 10,
          );
          account.deposit(value, date: date);
          break;
        default:
          if (accounts.isNotEmpty) {
            var otherAccount = faker.randomGenerator.element(accounts);

            if (faker.randomGenerator.boolean()) {
              value = faker.randomGenerator.decimal(
                scale: account.balance / 2.0,
                min: 1,
              );
              account.transferTo(otherAccount, value, date: date);
            } else {
              value = faker.randomGenerator.decimal(
                scale: otherAccount.balance / 2.0,
                min: 1,
              );
              otherAccount.transferTo(account, value, date: date);
            }
          }
      }
    }
  }

  void showAccounts() {
    for (var account in accounts) {
      print(account);
    }
  }

  void showAccountStatements() {
    for (var account in accounts) {
      account.statement();
      print('#' * 80);
    }
  }

  void saveAccountsAsJson(String fileName) {
    // var accountList = <AccountMap>[];

    print(accounts);
    print('---------');
    for (var account in accounts) {
      print(account.toMap());
    }

    //File(fileName).writeAsStringSync(json);
  }
}

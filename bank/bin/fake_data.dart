import 'package:faker/faker.dart';

import 'package:bank/account.dart';
import 'package:bank/current_account.dart';
import 'package:bank/investment_account.dart';
import 'package:bank/saving_account.dart';
import 'package:bank/special_account.dart';
import 'package:bank/transaction.dart';

void createFakeData(List<Account> accounts, int count) {
  Faker faker = Faker();
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

    accounts.add(account);
  }

  //createFakeTransactions(faker, accounts);
}

void showFakeData(List<Account> accounts) {
  for (var account in accounts) {
    print(account);
  }
}

void createFakeTransactions(Faker faker, List<Account> accounts) {
  const transactions = <TransactionType>[
    TransactionType.withdrawal,
    TransactionType.deposit,
    TransactionType.payment,
    TransactionType.transfer,
  ];

  for (var account in accounts) {
    Transaction transaction;
    double value;

    var count = faker.randomGenerator.integer(41, min: 5);
    var date = DateTime(2020, 1, 1);

    while (count-- > 0) {
      var type = faker.randomGenerator.element(transactions);

      date.add(Duration(
        hours: faker.randomGenerator.integer(49, min: 2),
      ));

      switch (type) {
        case TransactionType.withdrawal:
          value = faker.randomGenerator
                  .decimal(scale: account.balance / 20.0, min: 1) *
              10;
          transaction = Transaction(
            nature: TransactionNature.debit,
            type: TransactionType.withdrawal,
            date: date,
            value: value,
          );
          break;
        case TransactionType.payment:
          break;
        case TransactionType.deposit:
          break;
        default:
          break;
      }
    }
  }
}

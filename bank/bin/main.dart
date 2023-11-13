import 'package:bank/account.dart';
import './fake_data.dart';

void main() {
  var accounts = <Account>[];

  createFakeData(accounts, 10);
  showFakeData(accounts);
}

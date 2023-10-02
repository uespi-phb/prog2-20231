// ignore: avoid_relative_lib_imports
import '../lib/number.dart';

void main() {
  var n1 = const Number(20);
  var n2 = const Number(-10);

  print('n1: $n1\t(${n1.hashCode})');
  print('n2: $n2\t(${n2.hashCode})');

  print('n1 is zero\t: ${n1.isZero()}');
  print('n1 is positive\t: ${n1.isPositive()}');
  print('n1 is negative\t: ${n1.isNegative()}');
  print('n1 is even\t: ${n1.isEven()}');
  print('n1 is odd\t: ${n1.isOdd()}');
  print('n1 is prime\t: ${n1.isPrime()}');
  print('n1 is Armstrong\t: ${n1.isArmstrong()}');
  print('n1!\t\t: ${n1.factorial()}');
  print('n1 reversed: ${n1.reverse()}');
}

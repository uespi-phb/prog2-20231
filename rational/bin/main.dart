// ignore: avoid_relative_lib_imports
import '../lib/rational.dart';

void main() {
  Rational r1 = Rational(5, 3);
  Rational r2 = Rational(5, 3);
  Rational r3 = Rational.from(r1);
  Rational r4 = Rational.fromString('-360/90');

  print('r1 = $r1 (${r1.hashCode})');
  print('r2 = $r2 (${r2.hashCode})');
  print('r3 = $r3 (${r3.hashCode})');
  print('r4 = $r4');
  print('r4.simplify() = ${r4.simplify()}');
  print('r1 + r2 = ${r1 + r2}');
  print('r1 - r2 = ${r1 - r2}');
  print('r1 * r2 = ${r1 * r2}');
  print('r1 / r2 = ${r1 / r2}');
  print('r1 > r2 = ${r1 > r2}');
  print('r1 < r2 = ${r1 < r2}');
  print('r1 >= r2 = ${r1 >= r2}');
  print('r1 <= r2 = ${r1 <= r2}');
  print('r1 == r2 = ${r1 == r2}');
}

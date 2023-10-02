import 'dart:math' as math;

class Number {
  final int _number;

  //Number(this._number);
  const Number(int number) : _number = number;

  @override
  String toString() {
    return '$_number';
  }

  bool isZero() => _number == 0;
  bool isPositive() => _number > 0;
  bool isNegative() => _number < 0;
  bool isEven() => _number % 2 == 0;
  bool isOdd() => _number % 2 != 0;
  int sqr() => _number * _number;
  double sqrt() => math.sqrt(_number);
  String toRadix(int radix) => _number.toRadixString(radix);

  bool isPrime() {
    if (_number < 2) {
      return false;
    }
    for (int d = 2; d < _number; d++) {
      if (_number % d == 0) {
        return false;
      }
    }
    return true;
  }

  // Examples: 0, 1, 153, 370, 371, 407
  bool isArmstrong() {
    int number = _number;
    int digits = number.toString().length;
    int sum = 0;

    if (number < 0) {
      return false;
    }

    while (number != 0) {
      var d = number % 10;
      var p = math.pow(d, digits).toInt();

      sum = sum + p;

      number = number ~/ 10;
    }

    return sum == _number;
  }

  int factorial() {
    int mulBits(int a, int b) {
      var aBits = math.log(a) / math.log(2);
      var bBits = math.log(b) / math.log(2);
      return (aBits + bBits).toInt() + 1;
    }

    int f = 1;

    for (int k = _number; k > 0; k--) {
      if (mulBits(f, k) > 63) {
        throw Exception('Overflow: result is to big.');
      }
      f = f * k;
    }

    return f;
  }

  int digitsSum([int radix = 10]) {
    int number = _number.abs();
    int sum = 0;

    while (number != 0) {
      sum += number % radix;
      number = number ~/ radix;
    }
    return sum;
  }

  int reverse() {
    var number = _number.toString().split('').reversed.join();
    return int.parse(number);
  }
}

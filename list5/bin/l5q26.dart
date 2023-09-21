void main() {
  int number = 145934546523;
  int radix = 2;
  String r;

  try {
    r = intToBinary(number);
    print('$number na base 2: $r');

    radix = 2;
    r = intToRadix(number, radix);
    print('$number na base $radix: $r');

    radix = 8;
    r = intToRadix(number, radix);
    print('$number na base $radix: $r');

    radix = 16;
    r = intToRadix(number, radix);
    print('$number na base $radix: $r');

    radix = 90;
    r = intToRadix(number, radix);
    print('$number na base $radix: $r');
  } catch (error) {
    print('Error converting number to radix $radix');
  }
}

String intToBinary(int number) {
  String result = '';
  String signal = (number < 0) ? '-' : '';

  number = number.abs();
  do {
    result = ((number % 2 == 0) ? '0' : '1') + result;
    number = number ~/ 2;
  } while (number != 0);

  return signal + result;
}

String intToRadix0(int number, [int radix = 2]) {
  const digits = '0123456789abcdefghijklmnopqrstuvwxyz';
  String signal = (number < 0) ? '-' : '';
  String result = '';

  number = number.abs();
  do {
    result = digits[number % radix] + result;
    number = number ~/ radix;
  } while (number != 0);

  return signal + result;
}

String intToRadix(int number, [int radix = 2]) {
  String signal = (number < 0) ? '-' : '';
  String result = '';
  String digit;
  int value;

  if ((radix < 2) || (radix > 36)) {
    throw RangeError('Invalid radix: $radix');
  }

  number = number.abs();
  do {
    value = number % radix;
    digit = (value < 10)
        ? String.fromCharCode(48 + value)
        : String.fromCharCode(87 + value);
    result = digit + result;
    number = number ~/ radix;
  } while (number != 0);

  return signal + result;
}

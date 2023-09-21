void main() {
  double val = 123456789000.33876;
  String f;

  f = formatNumber(val);
  print('$val -> $f');

  f = formatNumber(val, decimalPlaces: 0);
  print('$val -> $f');

  f = formatNumber(val, currency: '');
  print('$val -> $f');

  f = formatNumber(
    val,
    thousandSeparator: ',',
    decimalSeparator: '.',
    currency: r'R$ ',
    decimalPlaces: 4,
  );
  print('$val -> $f');
}

String formatNumber(
  double number, {
  int decimalPlaces = 2,
  String thousandSeparator = '.',
  String decimalSeparator = ',',
  String currency = r'R$', // 'R\$'
}) {
  var result = currency;
  var text = number.toStringAsFixed(decimalPlaces);
  var intDigits = text.length - decimalPlaces - (decimalPlaces > 0 ? 1 : 0);
  var di = (intDigits % 3 != 0) ? intDigits % 3 : 3;
  var i = 0;

  while (i < intDigits) {
    result += text.substring(i, i + di);
    i = i + di;
    if (i < intDigits) {
      result += thousandSeparator;
    }
    di = 3;
  }

  if (decimalPlaces > 0) {
    result += decimalSeparator;
    result += text.substring(intDigits + 1);
  }

  return result;
}

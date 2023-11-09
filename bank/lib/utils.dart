import 'dart:io';

void tabPrint(
  String text, [
  List<int>? tabs,
]) {
  final data = text.split('\t');

  tabs ??= [];

  for (int i = 0; i < data.length; i++) {
    text = data[i].trim();
    if (i < tabs.length) {
      if (tabs[i] > 0) {
        text = text.padRight(tabs[i]);
      } else if (tabs[i] < 0) {
        text = text.padLeft(tabs[i].abs());
      }
      if (text.length > tabs[i].abs()) {
        text = text.substring(0, tabs[i].abs());
      }
    }
    stdout.write(text);
  }
  stdout.write('\n');
}

void centerPrint(String text, int width) {
  final len = text.length;
  final gap = (len < width) ? ' ' * ((width - len) ~/ 2) : '';
  print('$gap$text');
}

String dateToDDMM(DateTime date, [String separator = '.']) {
  String day = date.day.toString().padLeft(2, '0');
  String mon = date.month.toString().padLeft(2, '0');
  return '$day$separator$mon';
}

String valueToString(
  double value, {
  int decimalPrecision = 2,
  String decimalSeparator = ',',
  String thousandSeparator = '.',
}) {
  var result = '';
  var signal = value.isNegative ? 'D' : 'C';
  var parts = value.abs().toStringAsFixed(decimalPrecision).split('.');
  var intPart = parts.isNotEmpty ? parts[0] : '';
  var decPart = parts.length > 1 ? parts[1] : '';
  var thounsandPlaces = intPart.length % 3;
  var i = 0;

  if (thounsandPlaces == 0) {
    thounsandPlaces = 3;
  }

  while (i < intPart.length) {
    result = result + intPart.substring(i, i + thounsandPlaces);
    if (i + thounsandPlaces < intPart.length) {
      result += thousandSeparator;
    }
    i += thounsandPlaces;
    thounsandPlaces = 3;
  }

  return '$result$decimalSeparator$decPart$signal';
}

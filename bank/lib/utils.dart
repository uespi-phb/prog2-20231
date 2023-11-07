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
  double value, [
  decimalPrecision = 2,
  decimalSeparator = ',',
  thousandSeparator = '.',
]) {
  var result = value.toStringAsFixed(decimalPrecision);
  if (decimalSeparator != '.') {
    result = result.replaceAll('.', decimalSeparator);
  }
  return result;
}

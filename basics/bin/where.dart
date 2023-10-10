void main() {
  var list1 = [
    'Abacate',
    'Ata',
    'Zilda',
    'Maçã',
    'Melancia',
  ];
  List<String> list2;

  print(list1);

  list2 = filterElementsMethod1(list1, 'e');
  print(list2);

  list2 = filterElementsMethod2(list1, 'e');
  print(list2);

  list2 = list1.where((elem) => elem.contains('e')).toList();
  print(list2);
}

List<String> filterElementsMethod1(List<String> list, String string) {
  var result = <String>[];

  for (var elem in list) {
    if (elem.contains(string)) {
      result.add(elem);
    }
  }

  return result;
}

List<String> filterElementsMethod2(List<String> list, String string) {
  return list.where((elem) => elem.contains(string)).toList();
}

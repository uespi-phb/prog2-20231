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

  list2 = modifyListUsingMethod1(list1);
  print(list2);

  list2 = modifyListUsingMethod2(list1);
  print(list2);

  list2 = modifyListUsingMethod2(list1);
  print(list2);
}

List<String> modifyListUsingMethod1(List<String> list) {
  var result = <String>[];

  for (var elem in list) {
    result.add('*$elem*');
  }

  return result;
}

List<String> modifyListUsingMethod2(List<String> list) {
  return list.map((elem) => '*$elem*').toList();
}

List<String> modifyListUsingMethod3(List<String> list) {
  return List.from(list.map((elem) => '*$elem*'));
}

void main() {
  var list = [
    'Abacate',
    'Ata',
    'Zilda',
    'Maçã',
    'Melancia',
  ];

  print(list);
  list.sort((e1, e2) => e1.compareTo(e2));
  print(list);
  list.sort((e1, e2) => -e1.compareTo(e2));
  print(list);
  list.sort((e1, e2) => e1.length - e2.length);
  print(list);
  list.sort((e1, e2) => e2.length - e1.length);
  print(list);
  list.sort(cmp);
  print(list);
}

int cmp(String e1, String e2) {
  print('$e1, $e2');
  return e1.length - e2.length;
}

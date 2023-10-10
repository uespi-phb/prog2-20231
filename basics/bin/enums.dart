import 'dart:io';

enum Gender {
  male,
  female,
  binary,
  metrosexual,
  pansexual,
}

void main() {
  Gender gender;
  int g;

  print('Qual o seu gênero:');
  for (var g in Gender.values) {
    print('${g.index}: ${g.name}');
  }

  g = int.parse(stdin.readLineSync() ?? '0');

  if ((g < 0) || (g >= Gender.values.length)) {
    throw Exception('Valor inválido: $g');
  }
  gender = Gender.values[g];

  // switch (g) {
  //   case 0:
  //     gender = Gender.male;
  //     break;
  //   case 1:
  //     gender = Gender.female;
  //     break;
  //   case 2:
  //     gender = Gender.binary;
  //     break;
  //   default:
  //     throw Exception('Valor inválido: $g');
  // }

  print('gender: $gender == ${gender.index}');
}

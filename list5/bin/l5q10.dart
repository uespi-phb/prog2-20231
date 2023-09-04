/*
 * Um número a é dito permutação de um número b se os dígitos de a formam 
 * uma permutação dos dígitos de b. Por exemplo, 5412 é uma permutação de 5214, 
 * mas não é uma permutação de 5211. Utilizando a função definida no exercício
 * anterior, escreva um programa que lê dois inteiros positivos a e b e 
 * responda se a é permutação de b.
 */

void main(List<String> args) {
  if (args.length != 2) {
    print('Usage: l5q10 N1 N2');
    return;
  }

  print('${args[0]} <=> ${args[1]}: ${isPermutation(args[0], args[1])}');
}

bool isPermutation(String arg1, String arg2) {
  if (arg1.length != arg2.length) {
    return false;
  }

  for (int i = 0; i < arg1.length; i++) {
    if (arg2.contains(arg1[i])) {
      return false;
    }
    if (arg1.contains(arg2[i])) {
      return false;
    }
  }

  return true;
}

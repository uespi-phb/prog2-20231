/*
 * Escreva um programa que lê um inteiro N, calcule e imprima o valor da seguinte soma:
 * S = 1/1 + 1/2 + 1/3 + 1/4 + ... + 1/N
*/

import 'dart:io';

void main() {
  print('*** Calcula Soma de Série ***\n');

  stdout.write('Informe N: ');
  var n = int.parse(stdin.readLineSync() ?? '0');

  var sum = 0.0;

  for (int k = 1; k <= n; k++) {
    sum += 1.0 / k;
  }

  print('Soma = $sum');
}

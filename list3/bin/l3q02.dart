/*
 * Escreva um programa que exiba os N primeiros números naturais 
 * ímpares separados por vírgula.
*/

import 'dart:io';

void main() {
  print('*** Exibe os N primeiros naturais ímpares ***\n');

  print('Informe N: ');
  /*
  var data = stdin.readLineSync();
  var n = int.parse(data ?? '0');
  */
  var counter = int.parse(stdin.readLineSync() ?? '0');
  var oddNumber = 1;

  print('Os $counter primeiros naturais ímpares são:');
  while (counter > 0) {
    stdout.write('$oddNumber');

    counter--;
    oddNumber += 2;
  }
  stdout.write('\b\b \n');
}

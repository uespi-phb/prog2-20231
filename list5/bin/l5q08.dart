/*
 * L5Q8
 * Escreva a função que recebe como parâmetro um número inteiro e 
 * retorna quantos dígitos o número possui em uma base numérica B.
 */

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: l5q08 NUM...');
    return;
  }

  for (var data in args) {
    var number = int.tryParse(data);
    if (number != null) {
      // var digs = countDigits(number);
      // print('$data: $digs');
      print('$data: ${countDigits(number)}');
    } else {
      print('$data: NaN');
    }
  }
}

int countDigits(int number, [int base = 10]) {
  int counter = 0;

  do {
    number = number ~/ base;
    counter++;
  } while (number != 0);

  return counter;
}

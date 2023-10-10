void main() {
  int x = 10;
  int y = 20;

  print(calc(
    10,
    20,
    (a, b) => a + b,
  ));
  print(calc(10, 20, (a, b) {
    return a - b;
  }));

  print(calc(10, 20, mul));

  print(calc(20, 10, (int a, int b) => a ~/ b));
}

int div(int a, int b) {
  return a ~/ b;
}

int calc(int a, int b, int Function(int, int) operation) {
  return operation(a, b);
}

int add(int a, int b) {
  return a + b;
}

int sub(int a, int b) {
  return a - b;
}

int mul(int a, int b) {
  return a * b;
}

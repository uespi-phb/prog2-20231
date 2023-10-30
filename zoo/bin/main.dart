import 'package:zoo/zoo.dart';

void main() {
  var zoo = Zoo();

  zoo.load('exerc-zoo.csv');
  zoo.listAnimal();
}

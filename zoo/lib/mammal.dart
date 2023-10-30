import './animal.dart';

class Mammal extends Animal {
  Mammal({
    required super.name,
    required super.brithDate,
    required super.sound,
    required super.canFly,
    required super.canSwim,
    required super.canWalk,
  }) : super(type: AnimalType.mammal);
}
